package com.tuana9a.learn.springboot.application;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;

/**
 * tự động quest component không cần @ComponentScan
 * phạm vi quét, mọi class, mọi package cùng cấp đổ xuống (quét mọi nút con)
 * 
 * @SpringBootApplication = @ComponentScan + @EnableAutoConfiguration
 */

// VD:
@ComponentScan("com.tuana9a")
@EnableAutoConfiguration
public class AutoConfigApplication {

}
