package com.tuana9a.controllers;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

import com.tuana9a.config.AppConfig;
import com.tuana9a.entities.Doc;
import com.tuana9a.services.DocsService;

import org.apache.lucene.index.IndexWriter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/lucene")
public class LuceneController {

    @Autowired
    private AppConfig config;

    @Autowired
    private DocsService service;

    public void scanFiles(File[] files) throws IOException {
        for (File file : files) {
            String filename = file.getName();
            if (filename.matches(config.IGNORE_START_EXT_REGEX) || filename.matches(config.IGNORE_END_EXT_REGEX)) {
                continue;
            }
            if (file.isDirectory()) {
                scanFiles(file.listFiles()); // Calls same method again.
            } else if (filename.endsWith(".html")) {
                String path = file.getPath();
                String url = "/explorer/" + path.substring(2).replace("\\", "/");
                String content = new String(Files.readAllBytes(Paths.get(path)));
                Doc doc = new Doc();
                doc.setUrl(url);
                doc.setContent(content);
                service.add(doc);
            }
        }
    }

    @PostMapping(value = "/build")
    public ResponseEntity<Object> build(@RequestHeader("secret") String secret) throws IOException {
        long count = -1;
        IndexWriter indexWriter = service.getIndexWriter();
        if (secret.equals(config.SECRET)) {
            scanFiles(new File(".").listFiles());
            indexWriter.commit();
            count = indexWriter.maxDoc();
        }
        return ResponseEntity.ok(count);
    }

    @PostMapping(value = "/clear")
    public ResponseEntity<Object> clear(@RequestHeader("secret") String secret) throws IOException {
        long count = -1;
        IndexWriter indexWriter = service.getIndexWriter();
        if (secret.equals(config.SECRET)) {
            count = indexWriter.deleteAll();
            indexWriter.commit();
        }
        return ResponseEntity.ok(count);
    }

}