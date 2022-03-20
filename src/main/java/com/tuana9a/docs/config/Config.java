package com.tuana9a.docs.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import lombok.ToString;

@ToString
@Component
public class Config {
    @Value("${custom.root_dir}")
    public String ROOT_DIR;
    public String IGNORE_REGEX = ".*(\\.ps1|\\.cmd|\\.reg)$";
    public String EXPLORER_PREFIX = "/explorer/";
    public String TEMPLATE_FOLER_RENDER = "explorer.folder.render";

    public int BUFFER_SIZE = 1024; // 1KB
    public long DEFAULT_EXPIRE_TIME = 604800000L; // 1 weeks
    public String MULTIPART_BOUNDARY = "MULTIPART_BYTERANGES";
}
