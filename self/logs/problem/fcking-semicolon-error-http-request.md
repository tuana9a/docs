# fcking semicolon error http request

```jsx
let url = "/register";
function api() {
	return fetch(url, {
		method: "POST",
		headers: {
			// cái dấu chấm phẩy ở cuối hại thận vãi đái
			"Content-Type": "application/json; charset=utf-8;",
		},
		body: JSON.stringify(user),
	}).then((resp) => resp.json());
}
```

mất mịa 30p hay cả tiếng không nhớ cơ mà cái dấu chẩm phẩy ở chỗ `charset=utf-8;`
khi gửi tới server ignore hay như nào đó làm dữ liệu gửi lên bị toang, khá mệt mấy lỗi kiểu này