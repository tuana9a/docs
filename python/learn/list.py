# LIST (mảng)
xs = [3, 1, 2] 		# Tạo 1 list
print(xs, xs[2]) 	# "[3, 1, 2] 2"
print(xs[-1]) 		# "2" phần từ từ cuối ngc lên
xs[2] = 'foo' 		# "[3, 1, 'foo']"
xs.append('bar') 	# Thêm cuối list "[3, 1, 'foo', 'bar']"
x = xs.pop() 		# lấy phần tử cuối và bỏ "bar [3, 1, 'foo']"

nums = list(range(5)) 	# sinh 1 list 	   "[0, 1, 2, 3, 4]"
print(nums[2:4]) 	# 2 -> 4   "[2, 3]"
print(nums[2:]) 	# 2 -> hết "[2, 3, 4]"
print(nums[:2]) 	# đầu -> 2 "[0, 1]"
print(nums[:]) 		# tất cả   "[0, 1, 2, 3, 4]"
print(nums[:-1]) 	# đầu -> ngc  "[0, 1, 2, 3]"
nums[2:4] = [8, 9] 	# Gán mới 2 -> 4
print(nums) 		# "[0, 1, 8, 9, 4]"
