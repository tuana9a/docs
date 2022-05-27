# ClassLoader

![](./img/ClassLoader.jpg)

java không load toàn bộ class vào JVM (or MEM) vì nếu thế thì toang vl <br>
cũng như OS khi chạy chương trình chỉ load một phần chương trình<br>
chứ không load toàn bộ

ClassLoader là một phần của JRE <br>
do vậy JVM không cần quan tâm việc thừa thiếu class,<br>
cần thì gọi ClassLoader, có thì dùng <br>
không có thì sẽ là ClassNotFoundException

# Các loại ClassLoader

## Application (or System) ClassLoader

con của Extension ??? <br>
load classes found in the classpath environment variable <br>
cụ thể là trong "-classpath or -cp in cmd"

## Extension ClassLoader
con của Boostrap ??? <br>
load classes that are extension of standard java core <br>
cụ thể là trong "%JAVA_HOME%/lib/ext"

## Boostrap (or Primordial) ClassLoader

phục vụ các ClassLoader khác như "bố" <br>
các ClassLoader khác đều phải đc load qua thằng này =)) <br>
không phải là class trong java (native code) <br>
cụ thể là "rt.jar" và các libraries "%JAVA_HOME%/jre/lib" <br>
do vậy nó mới load đc các ClassLoader khác <br>
platform dependent

# Delegation Model

ClassLoader con sẽ ủy nhiệm việc tìm class cho bố liền trước nó

cụ thể khi có request tìm class thì Application là đầu tiên <br>
và ủy thác cho Extension => lại ủy thác cho Boostrap <br>
Application => Extension => Boostrap <br>
chỉ khi Boostrap và Extension không tìm thấy <br>
thì Application phải tự tìm

## Visibility

(phần này k biết dịch có đúng không)

các class được load bởi ClassLoader bố thì visible với các ClassLoader con

VD: ClassA load bởi Application và ClassB load bởi Extension <br>
thì Application thấy ClassA và ClassB <br>
nhưng Extension thì chỉ thấy ClassB <br>
và Boostrap thì éo thấy gì cả (ClassNotFoundException)
