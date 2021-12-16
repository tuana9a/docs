/**
 * tự động quest component không cần @ComponentScan
 * phạm vi quét, mọi class, mọi package cùng cấp đổ xuống (quét mọi nút con)
 * 
 * @SpringBootApplication = @ComponentScan + @EnableAutoConfiguration
 */

// VD:
@ComponentScan("com.tuana9a")
@EnableAutoConfiguration
public class TestApplication {

}

// tương đương với

@SpringBootApplication
public class TestApplication {

}
