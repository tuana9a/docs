# TYPE
x = 1
type(x) # trả về kiểu dữ liệu x

# STRING
x = "tuan" 		        #hoặc x ='tuan'
len(x)			        #trả về độ dài xâu x
y = '%s %d' % (x, 12)	#format chuỗi
s = "hello"
s.capitalize()		    # Viết hoa chữ cái đầu "Hello"
s.upper() 		        # "HELLO"
s.replace('l', '(ell)')	# "he(ell)(ell)o"
' world '.strip()	    # .trim() trong java "world"


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


# LOOP
animals = ['cat', 'dog', 'monkey']
for idx, animal in enumerate(animals):
    print('#%d: %s' % (idx + 1, animal))
    # "#1: cat", "#2: dog", "#3: monkey"


# DICTIONARIES key-value
d = {'cat': 'cute', 'dog': 'furry'} # Tạo dictionary
print(d['cat']) 	# Lấy value key 'cat' là "cute"
print('cat' in d) 	# check key trong dictionary "True"
d['fish'] = 'wet' 	# Gán key - value
print(d['fish']) 	# Prints "wet"
print(d['monkey']) 	# Lỗi vì 'monkey' không trong dictionary;
del d['fish'] 		# Xóa key:value từ dictionary


# LOOP
d = {'person': 2, 'cat': 4, 'spider': 8}
for animal, legs in d.items():
    print('A %s has %d legs' % (animal, legs))
    # "A person has 2 legs", "A cat has 4 legs", "A spider has 8 legs"


# FUNCTION
def sign(x):
    if x > 0:
        return 'positive'
    elif x < 0:
        return 'negative'
    else:
        return 'zero'

print("done")