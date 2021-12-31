// http request

let url = "/";
let method = "GET"; // POST, PUT, DELETE
let xhttp = new XMLHttpRequest();
xhttp.onreadystatechange = function () {
    if (this.readyState == 4 && this.status == 200) {
        let object = JSON.parse(this.responseText);
        console.log(object);
    }
};

//GET
xhttp.open(method, url);
xhttp.send();

//POST
xhttp.open(method, url);
// form url encode
xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
xhttp.send("fname=Henry&lname=Ford");
// upload file
let file = new File();
let formData = new FormData();
formData.append("file", file);
xhttp.send(formData);
// body json
xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
let data = { username: "tuana9a", password: "password" };
xhttp.send(JSON.stringify(data));

// upload progress event
xhttp.upload.addEventListener("progress", function (e) {
    let percent = (e.loaded / e.total) * 100;
    // Percentage of upload completed
    console.log(percent);
});
