# why java string is immutable

Tags: java

- string pool và toán tử == là so sánh cùng địa chỉ
    - do vậy 2 biến string cùng trỏ tới vùng nhớ ở spring pool sẽ bằng nhau
- khi biến tring được thay đổi string pool sẽ tạo string mới và biến sẽ được trỏ lại tới vị trí này
    - do vậy nếu có 2 biến tring cùng giá trị nhưng khởi tạo bằng new String() thì dùng toán tử == sẽ cho kết quả false
- sử dụng string immutable cho phép nhiều biến có giá trị string giống nhau trỏ về cùng một nơi giảm bộ nhớ sử dụng
- sử dụng string immutable cho phép thread safe khi có cả ngàn thread có biến string cùng giá trị này