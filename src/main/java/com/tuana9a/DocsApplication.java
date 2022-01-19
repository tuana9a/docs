package com.tuana9a;

import java.io.IOException;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class DocsApplication implements CommandLineRunner {

    public static void main(String[] args) {
        SpringApplication.run(DocsApplication.class, args);
    }

    @Override
    public void run(String... args) throws IOException {
    }
}