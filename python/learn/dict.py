# DICTIONARIES key-value
d = {'cat': 'cute', 'dog': 'furry'} # Tạo dictionary
print(d['cat']) 	# Lấy value key 'cat' là "cute"
print('cat' in d) 	# check key trong dictionary "True"
d['fish'] = 'wet' 	# Gán key - value
print(d['fish']) 	# Prints "wet"
print(d['monkey']) 	# Lỗi vì 'monkey' không trong dictionary;
del d['fish'] 		# Xóa key:value từ dictionary
