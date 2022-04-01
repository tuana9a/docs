const fs = require("fs");
const path = require("path");
const http = require("http");
const https = require("https");
const express = require("express");

const CONFIG = require("./configs");

function createFaviconUrl(token) {
    const encodeValue = Buffer.from(token).toString("hex");
    return "https://avatars.dicebear.com/api/identicon/" + encodeValue + ".svg";
}

async function main() {
    const server = express();
    server.set("view engine", "ejs");
    server.use("/", express.static("./src/main/webapp/"));
    server.use("/libs", express.static("./libs"));
    server.use(CONFIG.explorerPrefix, express.static("."));
    server.get(CONFIG.explorerPrefix + "*", function (req, res) {
        let pathRequest = req.path;
        let realpath = pathRequest.substring(CONFIG.explorerPrefix.length);
        let faviconUrl = createFaviconUrl(realpath);
        let filepaths = fs.readdirSync(path.join(".", realpath));
        const entries = [];
        for (let filepath of filepaths) {
            const isDir = fs.statSync(path.join(".", realpath, filepath)).isDirectory();
            const entry = {};
            entry.name = isDir ? filepath + "/" : filepath;
            entry.url = path.join(CONFIG.explorerPrefix, realpath, filepath);
            entry.type = isDir ? "d" : "f";
            entries.push(entry);
        }
        res.render("explorer", { faviconUrl: faviconUrl, titleName: pathRequest, entries: entries });
    });
    let port = CONFIG.port;
    if (CONFIG.ssl.enabled) {
        // https
        const key = fs.readFileSync(CONFIG.ssl.key);
        const cert = fs.readFileSync(CONFIG.ssl.cert);
        https.createServer({ key, cert }, server).listen(port, CONFIG.bind);
    } else {
        // http
        http.createServer(server).listen(port, CONFIG.bind);
    }
}

main();
