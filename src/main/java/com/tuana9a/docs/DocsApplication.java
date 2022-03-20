package com.tuana9a.docs;

import java.io.IOException;

import com.tuana9a.docs.config.Config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class DocsApplication implements CommandLineRunner {

    @Autowired
    private Config config;

    public static void main(String[] args) {
        SpringApplication.run(DocsApplication.class, args);
    }

    @Override
    public void run(String... args) throws IOException {
        System.out.println("ROOT_DIR: " + config.ROOT_DIR);
    }
}