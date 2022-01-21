package com.tuana9a.controllers;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.RandomAccessFile;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.zip.GZIPOutputStream;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tuana9a.config.AppConfig;
import com.tuana9a.utils.ExplorerUtils;
import com.tuana9a.utils.HttpUtils;
import com.tuana9a.utils.IoUtils;
import com.tuana9a.utils.Utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ExplorerController {

    private static class Range {
        public long start;
        public long end;
        public long length;
        public long total;

        /**
         * Constructor
         *
         * @param start Start of byte-range
         * @param end   End of byte-range
         * @param total Total bytes of file
         */
        public Range(long start, long end, long total) {
            this.start = start;
            this.end = end;
            this.total = total;
            this.length = end - start + 1;
        }
    }

    @Autowired
    private AppConfig config;

    @Autowired
    private HttpUtils httpUtils;

    @Autowired
    private IoUtils ioUtils;

    @Autowired
    private Utils utils;

    @Autowired
    private ExplorerUtils explorerUtils;

    @RequestMapping(value = { "/explorer/**/*", "/explorer/" }, method = RequestMethod.GET)
    public void send(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        // SECTION: Validate request file
        // ------------------------------------------------------------------
        String explorerPrefix = config.EXPLORER_PREFIX;
        String requestURI = req.getRequestURI();

        String pathRequest;
        if (requestURI.equals(explorerPrefix)) {
            pathRequest = "/";
        } else {
            pathRequest = requestURI.substring(explorerPrefix.length());
        }

        // URL-decode the file name (might contain spaces and on) and prepare file
        // object.
        String pathDecoded = URLDecoder.decode(pathRequest, "UTF-8");
        File file = new File(config.DOCS_FIR, pathDecoded);

        // Check if file actually exists in filesystem.
        if (!file.exists()) {
            // Throw an exception, or send 404, or show default/warning page, or just ignore
            // it.
            resp.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        if (file.isDirectory()) {
            sendFolder(file, req, resp, pathRequest);
            return;
        }

        if (file.isFile()) {
            sendFile(file, req, resp);
            return;
        }
        // unknown what is this file
        resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
    }

    private void sendFolder(File folder, HttpServletRequest req, HttpServletResponse resp, String parentPath)
            throws IOException, ServletException {
        File[] files = folder.listFiles();
        StringBuilder html = new StringBuilder();

        html.append("<head>");
        String randomCode = Base64.getEncoder().encodeToString(parentPath.getBytes(StandardCharsets.UTF_8));
        String randomIcon = "https://avatars.dicebear.com/api/identicon/" + randomCode + ".svg";
        String favicon = "<link rel=\"shortcut icon\" href=\"" + randomIcon + "\" type=\"image/x-icon\">";
        html.append(favicon);
        String style = "<style> a { font-size: 20px; display:inline-block; padding: 2px 5px; text-decoration: none; } a:hover { background-color: #84a7db; }</style>";
        html.append(style);
        html.append("</head>");

        html.append("<body>");
        String parentDir;
        if (parentPath.equals("/")) {
            parentPath = "";
        } else if (!parentPath.endsWith("/")) {
            parentPath += "/";
        }
        parentDir = "<a href=\"" + config.EXPLORER_PREFIX + parentPath + ".." + "\">..</a><br/>";
        html.append(parentDir);
        if (files != null) {
            for (File file : files) {
                String filename = file.getName();
                if (explorerUtils.isSkip(filename)) {
                    continue;
                }
                String path = parentPath + filename;
                String url = config.EXPLORER_PREFIX + path;
                String type = file.isDirectory() ? "d" : "f";
                String a = "<a href=\"" + url + "\" data-type=\"" + type + "\">" + filename + "</a><br/>";
                html.append(a);
            }
        }
        html.append("</body>");

        resp.setContentType("text/html; charset=utf-8;");
        PrintWriter printWriter = resp.getWriter();
        printWriter.print(html);
    }

    private void sendFile(File file, HttpServletRequest req, HttpServletResponse resp) throws IOException {
        // Prepare some variables. The ETag is an unique identifier of the file.
        String fileName = file.getName();
        long length = file.length();
        long lastModified = file.lastModified();
        String eTag = fileName + "_" + length + "_" + lastModified;
        long expires = System.currentTimeMillis() + config.DEFAULT_EXPIRE_TIME;

        // SECTION: Validate request headers for caching
        // ---------------------------------------------------

        String ifNoneMatch = req.getHeader("If-None-Match");
        // If-None-Match header should contain "*" or ETag. If so, then return 304.
        if (ifNoneMatch != null && httpUtils.checkHeaderMatchValue(ifNoneMatch, eTag)) {
            resp.setStatus(HttpServletResponse.SC_NOT_MODIFIED);
            resp.setHeader("ETag", eTag); // Required in 304.
            resp.setDateHeader("Expires", expires); // Postpone cache with 1 week.
            return;
        }

        long ifModifiedSince = req.getDateHeader("If-Modified-Since");
        // If-Modified-Since header should be greater than LastModified. If so, then
        // return 304.
        if (ifNoneMatch == null && ifModifiedSince != -1 && ifModifiedSince + 1000 > lastModified) {
            // EXPLAIN: This header is ignored if any If-None-Match header is specified.
            resp.setStatus(HttpServletResponse.SC_NOT_MODIFIED);
            resp.setHeader("ETag", eTag); // Required in 304.
            resp.setDateHeader("Expires", expires); // Postpone cache with 1 week.
            return;
        }

        // SECTION: Validate request headers for resume
        // ----------------------------------------------------

        String ifMatch = req.getHeader("If-Match");
        // If-Match header should contain "*" or ETag. If not, then return 412.
        if (ifMatch != null && !httpUtils.checkHeaderMatchValue(ifMatch, eTag)) {
            resp.sendError(HttpServletResponse.SC_PRECONDITION_FAILED);
            return;
        }

        // If-Unmodified-Since header should be greater than LastModified. If not, then
        // return 412.
        long ifUnmodifiedSince = req.getDateHeader("If-Unmodified-Since");
        if (ifUnmodifiedSince != -1 && ifUnmodifiedSince + 1000 <= lastModified) {
            resp.sendError(HttpServletResponse.SC_PRECONDITION_FAILED);
            return;
        }

        // SECTION: Validate and process range
        // -------------------------------------------------------------

        Range full = new Range(0, length - 1, length);// The full Range represents the complete file.
        List<Range> ranges = new ArrayList<>();

        // Validate and process Range and If-Range headers.
        String range = req.getHeader("Range");
        if (range != null) {
            // Range header should match format "bytes=n-n,n-n,n-n...". If not, then return
            // 416.
            if (!range.matches("^bytes=\\d*-\\d*(,\\d*-\\d*)*$")) {
                resp.setHeader("Content-Range", "bytes */" + length); // Required in 416.
                resp.sendError(HttpServletResponse.SC_REQUESTED_RANGE_NOT_SATISFIABLE);
                return;
            }

            String ifRange = req.getHeader("If-Range");
            // If-Range header should either match ETag or be greater then LastModified. If
            // not, return full file.
            if (ifRange != null && !ifRange.equals(eTag)) {
                try {
                    long ifRangeTime = req.getDateHeader("If-Range"); // Throws IAE if invalid.
                    if (ifRangeTime != -1 && ifRangeTime + 1000 < lastModified) {
                        ranges.add(full);
                    }
                } catch (IllegalArgumentException ignore) {
                    ranges.add(full);
                }
            }

            // If any valid If-Range header, then process each part of byte range.
            if (ranges.isEmpty()) {
                for (String part : range.substring(6).split(",")) {
                    // file length = 100, 50-80 (50 to 80), 40- (40 to 100), -20 (80 to 100).
                    long start = utils.getLongFromString(part, 0, part.indexOf("-"));
                    long end = utils.getLongFromString(part, part.indexOf("-") + 1, part.length());

                    if (start == -1) {
                        start = length - end;
                        end = length - 1;
                    } else if (end == -1 || end > length - 1) {
                        end = length - 1;
                    }

                    // Check if Range is syntactically valid. If not, then return 416.
                    if (start > end) {
                        resp.setHeader("Content-Range", "bytes */" + length); // Required in 416.
                        resp.sendError(HttpServletResponse.SC_REQUESTED_RANGE_NOT_SATISFIABLE);
                        return;
                    }

                    // Add range.
                    ranges.add(new Range(start, end, length));
                }
            }
        }

        // SECTION: Prepare and initialize response
        // --------------------------------------------------------

        String contentType = req.getServletContext().getMimeType(fileName);
        boolean acceptsGzip = false; // set default GZIP support and
        String disposition = "inline"; // set default content disposition.

        /*
         * đoạn code origin
         * // If content type is unknown, then set the default value.
         * if (contentType == null) {
         * // To add new content types, add new mime-mapping entry in web.xml.
         * contentType = "application/octet-stream";
         * }
         */

        // mình custom để mọi thứ là text
        if (contentType == null || contentType.equals("application/octet-stream") || contentType.equals("application/x-sh")) {
            contentType = "text/plain";
        }

        // If content type is text, check GZIP encoding is supported by the browser
        if (contentType.startsWith("text")) {
            String acceptEncoding = req.getHeader("Accept-Encoding");
            acceptsGzip = acceptEncoding != null && httpUtils.checkHeaderAccept(acceptEncoding, "gzip");
            // expand content type with the one and right character encoding.
            contentType += "; charset=UTF-8";
        }
        // Else If content type is supported by the browser, then set to inline, else
        // attachment
        else if (!contentType.startsWith("image")) {
            // EXPLAIN: expect for images, default supported by browser.
            String accept = req.getHeader("Accept");
            disposition = accept != null && httpUtils.checkHeaderAccept(accept, contentType) ? "inline" : "attachment";
        }

        // Initialize response.
        resp.reset();
        // resp.setBufferSize(Config._4MB_BUFFER_SIZE);
        resp.setHeader("Content-Disposition", disposition + ";filename=\"" + fileName + "\"");
        resp.setHeader("Accept-Ranges", "bytes");
        resp.setHeader("ETag", eTag);
        resp.setDateHeader("Last-Modified", lastModified);
        resp.setDateHeader("Expires", expires);

        // SECTION: Send requested file (part(s)) to client
        // ------------------------------------------------

        RandomAccessFile input = null;
        OutputStream output = null;

        try {
            // Open streams.
            input = new RandomAccessFile(file, "r");
            output = resp.getOutputStream();

            // Return full file.
            if (ranges.isEmpty() || ranges.get(0) == full) {
                resp.setContentType(contentType);
                if (acceptsGzip) {
                    // The browser accepts GZIP, so GZIP the content.
                    resp.setHeader("Content-Encoding", "gzip");
                    output = new GZIPOutputStream(output, config.BUFFER_SIZE);
                } else {
                    // Content length is not directly predictable in case of GZIP.
                    resp.setHeader("Content-Length", String.valueOf(full.length));
                    // So only add it if there is no means of GZIP, else browser will hang.
                }
                // Write full range.
                ioUtils.writeFileToOutput(input, output, full.start, full.length);

            } else if (ranges.size() == 1) {
                // Return single part of file.
                Range r = ranges.get(0);
                resp.setContentType(contentType);
                resp.setHeader("Content-Range", "bytes " + r.start + "-" + r.end + "/" + r.total);
                resp.setHeader("Content-Length", String.valueOf(r.length));
                resp.setStatus(HttpServletResponse.SC_PARTIAL_CONTENT); // 206.
                // Write partial of file.
                ioUtils.writeFileToOutput(input, output, r.start, r.length);

            } else {
                // Return multiple parts of file.
                resp.setContentType("multipart/byteranges; boundary=" + config.MULTIPART_BOUNDARY);
                resp.setStatus(HttpServletResponse.SC_PARTIAL_CONTENT); // 206.

                // Cast back to ServletOutputStream to get the easy println methods.
                ServletOutputStream sos = (ServletOutputStream) output;

                // Copy multi part range.
                for (Range r : ranges) {
                    // Add multipart boundary and header fields for every range.
                    sos.println();
                    sos.println("--" + config.MULTIPART_BOUNDARY);
                    sos.println("Content-Type: " + contentType);
                    sos.println("Content-Range: bytes " + r.start + "-" + r.end + "/" + r.total);
                    // Write single part range of multi part range.
                    ioUtils.writeFileToOutput(input, output, r.start, r.length);
                }

                // End with multipart boundary.
                sos.println();
                sos.println("--" + config.MULTIPART_BOUNDARY + "--");
            }
        } finally {
            // Gently close streams.
            ioUtils.close(output);
            ioUtils.close(input);
        }
    }

}
