# Skip List

phía dưới là hỉnh ảnh mô phỏng rất chân thực cách hoạt động của skip list

![Skip_list_add_element-en.gif](./Skip_list_add_element-en.gif)
By [Artyom Kalinin]("https://commons.wikimedia.org/wiki/User:Artyom_Kalinin") - Own work, [CC BY-SA 3.0]("https://creativecommons.org/licenses/by-sa/3.0"), [Link](https://commons.wikimedia.org/w/index.php?curid=30222103)

nhận xét:

- nó phù hợp với cách tổ chức file trên ổ đĩa
- tìm kiếm, thêm phần tử theo kiểu nhảy cóc "skip" O(logN)

khi thêm phần tử vào mảng, sẽ tung đồng xu quyết định có thêm phần tử này ở level cao hơn không?
việc nhảy cóc này khá "xác xuất" tuy nhiên với thực tế thì cho kết quả khá tốt

Skip list còn được gọi là "probabilistic datastructure": cấu trúc dữ liệu xác xuất. nếu may mắn thì ngon, nếu không thì không quá tệ
