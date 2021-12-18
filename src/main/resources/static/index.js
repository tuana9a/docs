const inputSearch = document.getElementById("inputSearch");
const searchResult = document.getElementById("searchResult");

async function onSearch() {
    let query = String(inputSearch.value);
    if (query.length == 0 || query.match(/^\s+$/)) {
        return;
    }
    let url = `/api/search?q=${query}`;
    fetch(url)
        .then((resp) => resp.json())
        .then((resp) => {
            if (resp.code == 1) {
                searchResult.innerHTML = "";
                let docs = resp.data;
                docs.forEach((doc) => {
                    let url = doc.url;
                    let a = document.createElement("a");
                    a.href = url;
                    a.innerText = url;
                    searchResult.append(a, document.createElement("br"));
                });
            }
        });
}

inputSearch.oninput = onSearch;
onSearch();
