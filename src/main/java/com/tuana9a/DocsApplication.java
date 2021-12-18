package com.tuana9a;

import com.tuana9a.config.AppConfig;
import com.tuana9a.indexers.DocsService;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.io.IOException;
import java.nio.file.Paths;

@SpringBootApplication
public class DocsApplication implements CommandLineRunner {

    @Autowired
    private AppConfig config;

    @Autowired
    private DocsService indexer;

    public static void main(String[] args) {
        SpringApplication.run(DocsApplication.class, args);
    }

    @Override
    public void run(String... args) throws IOException {
        Analyzer analyzer = new StandardAnalyzer();
        Directory dir = FSDirectory.open(Paths.get(config.LUCENE_INDEXES_DIR));
        indexer.setAnalyzer(analyzer);
        indexer.setDirectory(dir);
    }
}