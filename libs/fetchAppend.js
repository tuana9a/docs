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
        // init loading state
        let style = "background-color: #000800;";
        style += "color: #73ff00;";
        style += "padding: 2px 5px;";
        style += "font-family: monospace";
        this.element.innerHTML = `<strong style="${style}">Loading...</strong>`;
    }
    stopLoading() {
        // reset;
        this.element.innerHTML = "";
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

function main() {
    const elements = Array.from(document.getElementsByClassName("fetchAppend"));
    const entries = elements.map(function (element) {
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
    }, Math.random() * 100);
}
main();
