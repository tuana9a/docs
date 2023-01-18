# lucene concepts

nguồn từ [alibaba cloud](https://alibaba-cloud.medium.com/analysis-of-lucene-basic-concepts-5ff5d8b90a53)

## document

mỗi một document khi được đưa vào lucene sẽ được gán một docId duy nhất

## field

một doc được cấu thành tử một hoặc nhiều field, field là đơn vị dữ liệu nhỏ nhất trong lucene

StringField, TextField and NumericDocValuesField.

lucene sẽ tự detect và đưa ra chiến thuật index phù hợp

(such as Invert Index, Store Field, DocValues or N-dimensional)

lucene còn dựa vào FieldType để quyết định ở trên

## term và term dictionary

đơn vị nhỏ nhất phục vụ index và search, một field gồm một hoặc nhiều term

term được tạo ra khi cho một field qua một Analyzer (tokenizer)

term dictionary là chỉ mục đơn giản phục vụ conditional search dựa trên term

## Segment

một index trong lucene chứa một hoặc nhiều sub-index, một sub-index được gọi là segment

tổng quan sub-index của lucene có cơ chế giống LSM (Log-structured merge-tree)

xem thêm [https://yetanotherdevblog.com/lsm/](https://yetanotherdevblog.com/lsm/)

đại loại LSM là cấu trúc:

- phù hợp với heavy write (cập nhật liên tục) ghi thành sequence log, segment

  - các lệnh ghi được lưu trên ram khi vượt size tạo segment và ghi xuống disk
  - cấu trúc trên RAM có thể linh động tùy mục đích (cây đỏ đen) xem thêm [https://en.wikipedia.org/wiki/Red-black_tree](https://en.wikipedia.org/wiki/Red-black_tree)

  - các segemnt phải được xắp xếp theo thứ tự tăng dần

- dữ liệu được ghi dạng key-value, khá phù hợp với chỉ mục ngược
  - với key là từ (term) value là danh sách thẻ định vị

- có thể lưu thêm thông tin để tìm kiếm trên segment mới nhất (nhanh hơn tìm toàn bộ)

  - từ đó cho phép tìm kiếm trên nhiều segment một lúc (**có thể** cải thiện)
  - tuy nhiên nếu log quá nhiều thì vẫn cần phải merge (xem ý tiếp theo)

- có thể merge segment (định kì or rule) giảm dung lượng lưu trữ
  - merge sẽ lấy giá trị mới nhất của mỗi id
  - merge sẽ không lấy giá trị bị đánh tombstone (xóa ảo, sau đó làm thật)

## sequence number #TODO

## analyzer

xem code ở [https://lucene.apache.org/core/7_7_3/analyzers-common/index.html](https://lucene.apache.org/core/7_7_3/analyzers-common/index.html)
