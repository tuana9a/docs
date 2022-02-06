package com.tuana9a.docs.config;

import org.springframework.stereotype.Component;

import lombok.ToString;

@ToString
@Component
public class Config {
    public String ROOT_DIR = ".";
    public String IGNORE_REGEX = ".*(\\.ps1|\\.cmd|\\.reg)$";
    public String EXPLORER_PREFIX = "/explorer/";

    public int BUFFER_SIZE = 1024; // 1KB
    public long DEFAULT_EXPIRE_TIME = 604800000L; // 1 weeks
    public String MULTIPART_BOUNDARY = "MULTIPART_BYTERANGES";
}
