# Chrome V8 Engine

_chrome v8 engine hoạt động khá hay với một JIT Compiler_

ngôn ngữ js là một ngôn ngữ thông dịch (interpreter) <br>
tuy nhiên với engine SpiderMonkey <br>
js có thể được compile khiến tốc độ có thể tăng lên thấy rõ <br>
tuy nhiên việc compile js có thể làm giảm trải nghiệm phía người dùng <br>
vậy câu hỏi chrome v8 engine đã giải quyết vấn đề này như nào <br>
mà khiến nó tở nên mạnh mẽ như vậy

đại loại khi lần đầu chạy chương trình <br>
bộ compiler sẽ complie nhanh nhất có thể, <br>
cho ra các đoạn byte code không được tối ưu <br>

tuy nhiên tại thời điểm runtime,<nr>
những đoạn code này có thể được

-   compile lại
-   được tối ưu

và từ đó càng chạy càng nhanh

ngoài mô hình JIT ra, chrome hay các js engine khác <nr>
có rất nhiều cơ chế đặc biệt để xử lý <br>
các cấu trúc dữ liệu linh động của mình <br>
khiến js trở nên nhanh và mạnh mẽ như bây giờ

# Refs

[https://www.mnismt.space/blog/vai-net-ve-v8-javascript-engine-djang-sau-chrome-va-nodejs](https://www.mnismt.space/blog/vai-net-ve-v8-javascript-engine-djang-sau-chrome-va-nodejs)

[https://en.wikipedia.org/wiki/V8\_(JavaScript_engine)](<https://en.wikipedia.org/wiki/V8_(JavaScript_engine)>)
