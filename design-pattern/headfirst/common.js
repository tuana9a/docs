function load(option = { className: "", pathToClass: "" }) {
    fetch(option.pathToClass)
        .then((resp) => resp.text())
        .then((data) => (document.getElementById(option.className).innerHTML = "<pre>" + data + "</pre>"));
}
