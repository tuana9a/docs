package com.tuana9a.utils;

import com.tuana9a.config.AppConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ExplorerUtils {

    @Autowired
    private AppConfig config;

    public boolean isSkip(String filename) {
        if (filename.matches(config.IGNORE_END_EXT_REGEX) || filename.matches(config.IGNORE_START_EXT_REGEX)) {
            return true;
        }
        return false;
    }
}
