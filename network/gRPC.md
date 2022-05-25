# gRPC

explain video of ibm

[https://www.youtube.com/watch?v=hVrwuMnCtok](https://www.youtube.com/watch?v=hVrwuMnCtok)

communication problems between services:

-   python

    -   requests (HTTP 1.1)

-   Java SE 9

    -   HttpUrlConnection (HTTP 1.1)

-   Golang 1.16

    -   http (HTTP 2.0 by default)

each maintain it own implementation of HTTP protocol

gRPC solve what ?

-   single RPC call call what ever the service is

-   define schema

    -   with properties that required or optional
    -   define method call with arguments and return types

-   code generation

    -   with predefined file we can generate code for each language

-   gửi thông tin dạng binaries

    -   so với rest thì là json rồi phải đi kèm cả đống header

-   ??? vậy là có khi không cần thư viện cho mỗi thằng luôn
    - sử dụng thuần socket luôn :))
