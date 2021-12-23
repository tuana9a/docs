package com.tuana9a;

import com.tuana9a.config.AppConfig;
import com.tuana9a.services.DocsService;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
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
    private DocsService docService;

    public static void main(String[] args) {
        SpringApplication.run(DocsApplication.class, args);
    }

    @Override
    public void run(String... args) throws IOException {
        Analyzer analyzer = new StandardAnalyzer();
        Directory directory = FSDirectory.open(Paths.get(config.LUCENE_INDEXES_DIR));
        IndexWriterConfig conf = new IndexWriterConfig(analyzer);
        IndexWriter indexWriter = new IndexWriter(directory, conf);
        docService.setAnalyzer(analyzer);
        docService.setDirectory(directory);
        docService.setIndexWriter(indexWriter);
    }
}