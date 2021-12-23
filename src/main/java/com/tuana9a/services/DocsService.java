package com.tuana9a.services;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import com.tuana9a.entities.Doc;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.store.Directory;
import org.springframework.stereotype.Service;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Service
public class DocsService {

    private Analyzer analyzer;
    private Directory directory;
    private IndexWriter indexWriter;

    public DocsService() {

    }

    public void add(Doc doc) throws IOException {
        Document document = new Document();
        document.add(new TextField("url", doc.getUrl(), Field.Store.YES));
        document.add(new TextField("content", doc.getContent(), Field.Store.YES));
        indexWriter.addDocument(document);
    }

    public List<Doc> search(String field, String q, Integer top) throws ParseException, IOException {
        Query query = new QueryParser(field, analyzer).parse(q);

        IndexReader indexReader = DirectoryReader.open(directory);
        IndexSearcher searcher = new IndexSearcher(indexReader);
        TopDocs topDocs = searcher.search(query, top);
        List<Document> documents = new ArrayList<>();
        for (ScoreDoc scoreDoc : topDocs.scoreDocs) {
            documents.add(searcher.doc(scoreDoc.doc));
        }

        return documents.stream().map(fields -> Doc.builder()
                .url(fields.get("url"))
                .build())
                .collect(Collectors.toList());
    }

    public long clear() throws IOException {
        long count = indexWriter.deleteAll();
        indexWriter.commit();
        return count;
    }

}
