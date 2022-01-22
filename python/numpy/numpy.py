import numpy as np

# TIPs
"""
X_new = (X > threshold)
	set the entries of a matrix X to 0 and 1 based on a threshold
	so sánh từng phần tử của X vs threshold nếu X > hơn thì = 1, ngược lại = 0
"""
v = None
np.exp(v)		# ma trận e^x(i) tương ứng
np.log(v)		# ma trận log(x(i)) tương ứng
np.tanh(v)		# ma trận tanh(x(i)) tương ứng
np.abs(v)		# ma trận abs(x(i)) tương ứng
np.power(v, 2)  # ma trận (x^2) tương ứng
v**2			# (như trên)

v1 = None
v2 = None
np.maximum(v1, v2)  # ma trận lấy phần tử max của hai bên

# tính tổng theo chiều ngang và giữ số hàng
np.sum(v, axis=1, keepdims=True)

# tính ||x||, độ dài vector tính từ gốc O
x = None
np.linalg.norm(x, ord=2, axis=1, keepdims=True)


# KHỞI TẠO

a = np.array([1, 2, 3]) 	# array chứ k phải ma trận
print(a.shape)
# Prints "(3,)"

print(a[0], a[1], a[2])
# Prints "1 2 3"

a[0] = 5 	# Thay đổi phần tử vị trí số 0
print(a)
# Prints "[5, 2, 3]"
print(a.shape == (3,))  # True
a = a.reshape(1, 3)  # định dạng lại ma trận

b = np.array([[1, 2, 3], [4, 5, 6]])  # Tạo array - ma trận
print(b.shape) 		# Prints "(2, 3)"
print(b[0, 0], b[0, 1])  # Prints "1 2"

a = np.zeros((2, 2)) 	# ma trận với tất cả các phần tử 0
print(a)
# Prints "[[ 0. 0.]
#   	   [ 0. 0.]]"

b = np.ones((1, 2)) 	# ma trận với các phần từ 1
print(b)
# Prints "[[ 1. 1.]]"

c = np.full((2, 2), 7) 	# ma trận với các phần tử 7
print(c)
# Prints "[[ 7. 7.]
#   	   [ 7. 7.]]"

d = np.eye(2) 		# identity matrix - ma trận cơ sở
print(d)
# Prints "[[ 1. 0.]
#   	   [ 0. 1.]]"

e = np.random.randn((2, 2)) 	# ma trận với các phần tử được tạo ngẫu nhiên
print(e)
# maybe print
# "[[ 0.91940167 0.08143941]
#   [ 0.68744134 0.87236687]]"

a = np.array([[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]])
# ma trận kích thước (3, 4)
# [[ 1  2  3  4]
#  [ 5  6  7  8]
#  [ 9 10 11 12]]

print(a[0, 1]) 		# Prints "2"
a[0, 1] = 77 		# sửa giá trị


# LẤY PHẦN TỬ, ELEMENT ACCESS

b = a[:2, 1:3]  # ":2" => 2 row đầu, "1:3" => cột 2,3
print(b)
# [[2 3]
#  [6 7]]

row1 = a[1, :]			# Lấy hàng 2 trong a, output array
print(row1, row1.shape)
# Prints "[5 6 7 8] (4,)"

row2 = a[1:2, :] 		# Lấy hàng 1 & 2 trong a, output ma trận
print(row2, row2.shape)
# Prints "[[5 6 7 8]] (1, 4)"


# TOÁN TỬ, THAO TÁC
x = np.array([[1, 2], [3, 4]], dtype=np.float64)
y = np.array([[5, 6], [7, 8]], dtype=np.float64)

# Tính tổng
x + y
np.add(x, y)
# [[ 6.0  8.0]
#  [10.0 12.0]]

# Phép trừ
z = x - y
np.subtract(x, y)
# [[-4.0 -4.0]
#  [-4.0 -4.0]]

# Nhân hai ma trận
np.dot(x, y)
x.dot(y)
# [[19. 22.]
#  [43. 50.]]

# Phép nhân element-wise
x * y
np.multiply(x, y)
# [[ 5.0 12.0]
#  [21.0 32.0]]

# Phép chia element-wise
x / y
np.divide(x, y)
# [[ 0.2 	0.33333333]
#  [ 0.42857143 0.5 	  ]]

# Tính căn bậc hai
np.sqrt(x)
# [[ 1. 	1.41421356]
#  [ 1.73205081 2. 	  ]]

# OTHER
x = np.array([[1, 2], [3, 4]])
print(np.sum(x)) 	 # tổng tất cả trong array; prints "10"
print(np.sum(x, axis=0))  # tổng phần tử theo cột ; prints "[4 6]"
print(np.sum(x, axis=1))  # tổng phần tử theo hàng; prints "[3 7]"

# Cộng vector v với mỗi hàng của ma trận x, kết quả lưu ở ma trận y.
x = np.array([[1, 2, 3], [4, 5, 6], [7, 8, 9], [10, 11, 12]])
v = np.array([1, 0, 1])

# Tạo 1 array có chiều giống x
y = np.empty_like(x)

# Dùng loop để vector v với mỗi hàng của ma trận
for i in range(4):
    y[i, :] = x[i, :] + v
# Kết quả của y
# [[ 2  2  4]
#  [ 5  5  7]
#  [ 8  8 10]
#  [11 11 13]]


# Broadcasting
"""
ma trận 3*4 chia ma trận 1*4
	python sẽ chia từng hàng của ma trận 3
	cho ma trận 1 và đc kết quả là ma trận 3 mới
ma trận cộng vs một số
	python sẽ cố biến số thành ma trận tương ứng
	và cộng vào từng phần tử của ma trận
ma trận 2*3 cộng ma trận 1*3
	python sẽ biến 1*3 thành 2*3 bằng cách nhân đôi
	copy y nguyên hàng 1 thành hàng 2 và cộng
nói chung python sẽ cố biến về kiểu mà có thể thực hiện được
"""
