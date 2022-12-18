# Spring Frame Work

# Dependency Injection - DI

giả sử class có sự tương đồng VD: Bike, Car, Bus, SuperBike<br>
và khi sửa code, thêm, xóa, sửa thì phải sửa code tương ứng<br>
mục tiêu của DI là giảm sự phụ thuộc chặt khiến code cần sửa ít hơn

## GIẢI PHÁP:

-   có thể dùng interface Vehicle (nguyên lí trừu tượng)

    -   nếu đang dùng Car() mà muốn sang Bike()<br>
        nhưng phải sửa code và compile lại

-   dùng spring frame work
    -   không phải sửa code từ Car() sang Bike() chỉ cần sửa context.xml là được
    -   không cần sửa code, compile lại

# Setter Injection

`<property>` trong `<bean>` trong `context.xml` dùng setter method
**TODO**: cần check lại lâu không học quên bà nó r

bất kể thuộc tính là public hay private thì spring vẫn dùng setter<br>
nên nếu không có setter thì lỗi runtime <br>
đương nhiên lếu không có thuộc tính mà set thì lỗi runtime

# Constructor Injection (CI)

bấy nhiêu thuộc tính thì bấy nhiêu constructor-arg (bắt buộc)

nhiều hơn hoặc thiếu argument<br>
nói cách khác: không tìm đc contructor phù hợp thì lỗi runtime

trong `<bean>` đồng thời có `<constructor>` và `<setter>`
thì giá trị `<setter>` là giá trị lúc runtime

# @Component

đây là một bean

tham số

VD:

```java
@Component("id")
	// trong đó id là id cua bean
	// mặc định id là tên Class viết thường
	@Scope(value="prototype")
		// dùng như này thì mỗi lần gọi bean
		// là một lần khởi tạo
```

# @Autowired

chỉ wired được nếu tìm thấy 1 và chỉ một bean tương ứng<br>
không dùng setter nên setter không liên quan<br>
nếu có nhiều hơn 1 hoặc không có sẽ lỗi runtime

dùng được ở

-   thuộc tính
-   phương thức
-   tham số hàm khởi tạo
    -   tham số (required = false)
        -   chỉ có tác dụng nếu khởi tạo các bean thành công
            và tiêm fail thì chương trình k sao
        -   còn nếu khởi tạo fail thì toàn bộ chương trình fail luôn

khi thay đổi dependency qua bean, application-context<br>
thì giá trị của nó trong thằng chứa nó cũng thay đổi<br>
không khác gì một object bình thường

# @Configuration

dùng cho một thể loại context mà không dùng file xml, chỉ có code<br>
là "@Component" nhưng với mục đích là bean config<br>
nên sẽ được khởi tạo trước các @Component khác

# @ComponentScan

dùng cùng với @Configuration<br>
đặt ở class<br>
scan @Componant từ packages nào để tìm đc bean

# @Bean

**IMPORTANT!** tạo bean cách này force @Autowired nếu có<br>
và thuộc tính cuối cùng sau khi tạo sẽ do Spring<br>
trong lúc khởi tạo có thể set giá trị nhưng khi dùng sẽ<br>
là giá trị của Spring quyết định<br>

-   dùng cùng với @Configuration
-   đặt ở hàm trả về Object trong class @Configuration
-   tạo bean không liên quan bean @Component
-   id của bean tạo từ @Bean sẽ trùng với tên hàm<br>
    hoặc có thể đặt tên bằng VD: @Bean("tuan")

tức 1 class có thể tồn tại 2,3,... thể hiện: 1 từ @Bean, 1 từ Component,...

# @Primary

trong trường hợp có nhiều hơn 1 bean<br>
cùng là thể hiện của 1 class<br>
thì class @Primary sẽ được ưu tiên dùng

# @Qualifier

chỉ điểm cụ thể thằng bean nào
dùng id để nhận diện
VD: @Qualifier("bike")

# ApplicationContext

kế thừa BeanFactory

quản lí bean

-   lấy bean
-   sửa bean
-   xóa bean
-   bản thân cũng là một bean

```java
.getBeanOfType(Outfit.class).forEach(
	(k, v) -> System.out.println("name: " + k + " - value: " + v)
)
```

# ConfigurableApplicationContext

```java
	.getBeanFactory.registerSingleton("bike",new Bike())
```

# @SpringBootApplication

@SpringBootApplication = @ComponentScan + @EnableAutoConfiguration

```java
package com.tuana9a.learn.springboot;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
/**
 * tự động quest component không cần @ComponentScan
 * phạm vi quét, mọi class, mọi package cùng cấp đổ xuống (quét mọi nút con)
 */
@ComponentScan("com.tuana9a")
@EnableAutoConfiguration
public class AutoConfigApplication {

}

```

equals

```java
package com.tuana9a.learn.springboot;

import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpingBootApplication
public class Application {
    
}
```

# `application.properties`

2.3.x

[Common Application properties](https://docs.spring.io/spring-boot/docs/2.3.x/reference/html/appendix-application-properties.html#common-application-properties)

# @Transactional

```java
package com.tuana9a.learn.springboot;

import org.springframework.transaction.annotation.Transactional;

/**
 * như cái tên đã nêu lên tất cả, là một transaction với db
 * đặt ở class thì toàn bộ các method của chúng sẽ được kế thừa
 * đặt ở phương thức (method) thì chỉ phương thức đó được wrap
 * trong transaction
 */

@Transactional
public class TransactionalService {

    @Transactional(rollbackFor = { NullPointerException.class }, timeout = 15000)
    public void update(Object user) {
        // do some update here
    }

}
```