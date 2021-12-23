package com.tuana9a.utils;

import com.tuana9a.config.AppConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.*;

@Component
public class IoUtils {

    @Autowired
    private AppConfig config;

    //SECTION: general purpose
    public void writeFileToOutput(RandomAccessFile input, OutputStream output, long start, long length) throws IOException {
        byte[] buffer = new byte[config.BUFFER_SIZE];
        int read; //da doc duoc bao nhieu

        if (input.length() == length) {
            //full file
            while ((read = input.read(buffer)) > 0) {
                output.write(buffer, 0, read);
            }
        } else {
            //partial file
            input.seek(start);
            long toRead = length;
            while ((read = input.read(buffer)) > 0) {
                if ((toRead -= read) > 0) {
                    output.write(buffer, 0, read);
                } else {
                    //EXPLAIN: toRead now is negative, this code is CORRECT =)
                    output.write(buffer, 0, (int) toRead + read);
                    break;
                }
            }
        }
    }

    public void writeFileToOutput(RandomAccessFile input, OutputStream output) throws IOException {
        writeFileToOutput(input, output, 0, input.length());
    }

    public void writeInputToOutput(InputStream inputStream, OutputStream outputStream) throws IOException {
        byte[] buffer = new byte[1024];
        int read;
        while ((read = inputStream.read(buffer)) != -1) {
            outputStream.write(buffer, 0, read);
        }
    }

    public void close(Closeable closeable) {
        if (closeable != null) {
            try {
                closeable.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

}
