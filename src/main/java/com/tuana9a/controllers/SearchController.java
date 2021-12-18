package com.tuana9a.controllers;

import com.tuana9a.entities.JsonResponse;
import com.tuana9a.indexers.DocsService;
import org.apache.lucene.queryparser.classic.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;

@RestController
@RequestMapping("/api/search")
public class SearchController {
    @Autowired
    private DocsService docsService;

    @GetMapping
    public ResponseEntity<Object> search(@RequestParam("q") String q) throws ParseException, IOException {
        Object result = docsService.search("content", q, 10);
        return ResponseEntity.ok()
                .body(JsonResponse.builder()
                        .code(1)
                        .message("ok")
                        .data(result)
                        .build());
    }
}
