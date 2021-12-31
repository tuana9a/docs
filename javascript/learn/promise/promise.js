// promise

var promise = new Promise((resolve, reject) => {
    resolve("done");
    reject("failed");
    //kết quả sẽ là done và reject còn không được gọi
});
//có thể thêm await ở trước promise.then ... phía dưới để async =V
promise
    .then((msg) => {
        console.log(msg);
    })
    .catch((msg) => {
        console.log(msg);
    });

//promise all này sẽ đợi cả 3 thằng rồi mới then
var promise_1, promise_n;
Promise.all([promise_1, promise_n]).then((messages) => console.log(messages));

//promise race này thì chỉ chờ thằng nào xong đầu tiên thì gọi nó không chờ mấy thằng còn lại
Promise.race([promise_1, promise_n]).then((message) => console.log(message));
