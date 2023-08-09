# javascript

## V8 (JavaScript engine)

Chrome Engine V8 là một JIT (Just in time) Compiler với cơ chế hoạt động khá hay.

Ngôn ngữ js là một ngôn ngữ thông dịch (interpreter) đã được chứng minh là chậm hơn các ngôn cứ biên dịch (compiled), tuy nhiên với engine SpiderMonkey, js có thể được compile khiến tốc độ có thể tăng lên thấy rõ.

Tuy nhiên trong thời gian compile js người dùng sẽ phải chờ trước khi có thể sử dụng trang web, do vậy làm giảm trải nghiệm phía người dùng

Vậy câu hỏi chrome engine v8 đã giải quyết vấn đề này như nào mà khiến js trở nên mạnh mẽ như vậy ?

### V8 Design

Khi khởi chạy chương trình:

- bộ compiler sẽ complie nhanh nhất có thể
  - chỉ compile những đoạn code được gọi ngay trong hàm main
  - bỏ qua những đoạn code chưa được gọi (đánh dấu lại)
  - chấp nhận cho ra các đoạn byte code chưa tối ưu.

Trong quá trình chạy:

- Liên tục tối ưu và compile lại các đoạn code
  - các kỹ thuật tối ưu có thể sử dụng như [inlining](https://en.wikipedia.org/wiki/Inline_expansion), ...
  - liên tục thay thế những bytecode trước đó bằng byte code mới tối ưu hơn.

Vậy từ đó có thể đảm bảo được quá trình tải trang không quá lâu,
mà sau đó vẫn đáp ứng được trải nghiệm người dùng trong trang web

### Refs

[https://www.mnismt.space/blog/vai-net-ve-v8-javascript-engine-djang-sau-chrome-va-nodejs](https://www.mnismt.space/blog/vai-net-ve-v8-javascript-engine-djang-sau-chrome-va-nodejs)

[https://en.wikipedia.org/wiki/V8\_(JavaScript_engine)](<https://en.wikipedia.org/wiki/V8_(JavaScript_engine)>)
