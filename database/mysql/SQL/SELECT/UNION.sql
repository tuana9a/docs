UNION
-- và
UNION ALL

SELECT 1... UNION SELECT 2...;
-- lấy nội dung từ hai bảng nếu trùng nhau thì loại, nếu bảng này có bảng kia ko thì bảng ko sẽ null hết
SELECT 1... UNION ALL SELECT 2...;
-- lấy nội dung từ hai bảng lấy cả trùng nhau, nếu bảng này có bảng kia ko thì bảng ko sẽ null hết