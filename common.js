async function fetchAppendHtml(element, url) {
    return fetch(url)
        .then((resp) => resp.text())
        .then((data) => {
            const preElement = document.createElement("pre");
            preElement.innerHTML = data;
            element.appendChild(preElement);
        });
}
async function fetchAppendRaw(element, url) {
    return fetch(url)
        .then((resp) => resp.text())
        .then((data) => {
            const preElement = document.createElement("pre");
            preElement.innerText = data;
            element.appendChild(preElement);
        });
}

function main() {
    const fetchAppendElements = Array.from(document.getElementsByClassName("fetchAppend"));
    for (const element of fetchAppendElements) {
        let url = element.getAttribute("data-url");
        let raw = element.getAttribute("data-raw");
        if (raw) {
            fetchAppendRaw(element, url);
        } else {
            fetchAppendHtml(element, url);
        }
    }
}
main();
