# async in java

Created: March 9, 2022
Tags: java

được đấy nhưng mà sẽ chỉ nhận connection và không thể phục vụ chúng

do để đọc dữ liệu thì sẽ là hàm read, hàm này sẽ tự block tới khi có dữ liệu

do vậy chỉ có thể sử lí được 1 connection, sau connection này thì các connection sau nếu không dùng đa luồng thì sẽ không thể truy cập được nữa :V