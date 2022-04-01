class Entry {
    constructor({ element, baseUrl, url, renderType, onLoad }) {
        this.baseUrl = baseUrl;
        this.url = url;
        this.element = element;
        this.renderType = renderType;
        this.onLoad =
            onLoad ||
            function () {
                this.render();
            };
        this.data = null;
    }
    getFullUrl() {
        const base = this.baseUrl;
        const url = this.url;
        if (!base) {
            return url;
        }
        if (base.endsWith("/")) {
            base = base.slice(0, -1);
        }
        if (url.startsWith("/")) {
            url = url.substring(1);
        }
        return base + "/" + url;
    }
    startLoading() {
        this.element.classList.add("loading");
    }
    stopLoading() {
        this.element.classList.remove("loading");
    }
    async load() {
        let url = this.getFullUrl();
        const entry = this;
        return fetch(url)
            .then((res) => res.text())
            .then((data) => {
                entry.data = data;
                entry.stopLoading();
                entry.onLoad(data);
            });
    }
    render() {
        const preElement = document.createElement("pre");
        const data = this.data;
        if (this.renderType == "raw") {
            preElement.innerText = data;
        } else {
            preElement.innerHTML = data;
        }
        this.element.appendChild(preElement);
    }
}

// Create new link Element
let styleElement = document.createElement("style");
styleElement.textContent = `
.loading {
    --size: 13px;
    --ring-size: 3px;
    border: var(--ring-size) solid #f3f3f3;
    border-radius: 50%;
    border-top: var(--ring-size) solid #3498db;
    width: var(--size);
    height: var(--size);
    -webkit-animation: spin 2s linear infinite; /* Safari */
    animation: spin 2s linear infinite;
}

/* Safari */
@-webkit-keyframes spin {
    0% {
        -webkit-transform: rotate(0deg);
    }
    100% {
        -webkit-transform: rotate(360deg);
    }
}

@keyframes spin {
    0% {
        transform: rotate(0deg);
    }
    100% {
        transform: rotate(360deg);
    }
}
`;
// Append link element to HTML head
document.head.appendChild(styleElement);
// start load entry
const entries = Array.from(document.getElementsByClassName("fetchAppend")).map(function (element) {
    let url = element.getAttribute("data-url");
    let baseUrl = null; // FETCH_APPEND_BASE_URL;
    let opts = {};
    opts.element = element;
    opts.url = url;
    opts.baseUrl = baseUrl;
    if (element.classList.contains("raw")) {
        opts.renderType = "raw";
    }
    const entry = new Entry(opts);
    entry.startLoading();
    return entry;
});
setTimeout(async function () {
    for (const entry of entries) {
        await entry.load();
    }
}, 10);
