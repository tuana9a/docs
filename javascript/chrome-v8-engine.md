# Chrome V8 Engine

chrome v8 engine hoạt động khá hay với một JIT Compiler

ngôn ngữ js là một ngôn ngữ thông dịch (interpreter), tuy nhiên với engine SpiderMonkey, js có thể được compile khiến tốc độ có thể tăng lên thấy rõ.

tuy nhiên việc compile js có thể làm giảm trải nghiệm phía người dùng, vậy câu hỏi chrome v8 engine đã giải quyết vấn đề này như nào mà khiến nó tở nên mạnh mẽ như vậy ?

đại loại khi lần đầu chạy chương trình: bộ compiler sẽ complie nhanh nhất có thể, cho ra các đoạn byte code không được tối ưu.

tuy nhiên tại thời điểm runtime, những đoạn code này có thể được

- compile lại
- được tối ưu

và từ đó càng chạy càng nhanh

ngoài mô hình JIT ra, chrome hay các js engine khác, có rất nhiều cơ chế đặc biệt để xử lý các cấu trúc dữ liệu linh động của mình, khiến js trở nên nhanh và mạnh mẽ như bây giờ

## Refs

[https://www.mnismt.space/blog/vai-net-ve-v8-javascript-engine-djang-sau-chrome-va-nodejs](https://www.mnismt.space/blog/vai-net-ve-v8-javascript-engine-djang-sau-chrome-va-nodejs)

[https://en.wikipedia.org/wiki/V8\_(JavaScript_engine)](<https://en.wikipedia.org/wiki/V8_(JavaScript_engine)>)
