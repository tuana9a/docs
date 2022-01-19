package com.tuana9a.config;

import org.springframework.stereotype.Component;

import lombok.ToString;

@ToString
@Component
public class AppConfig {

    public String DOCS_FIR = ".";
    public String IGNORE_END_EXT_REGEX = ".*(\\.sh|\\.py|\\.yaml|\\.yml|\\.ps1|\\.cmd|\\.reg)$";
    public String IGNORE_START_EXT_REGEX = "^\\..*";
    public String EXPLORER_PREFIX = "/explorer/";

    public int BUFFER_SIZE = 1024; // 1KB
    public long DEFAULT_EXPIRE_TIME = 604800000L; // 1 weeks
    public String MULTIPART_BOUNDARY = "MULTIPART_BYTERANGES";

}
