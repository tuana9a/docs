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

const cache1day = {
    maxAge: "86400",
};

const setContentType = function (req, res, next) {
    next();
    if (req.path.match(/^.*(\.sh|\.cmd|\.ps1)$/)) {
        res.set("Content-Type", "text/plain");
    }
};

const sendDirectory = function (req, res) {
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
};

async function main() {
    const server = express();
    server.set("view engine", "ejs");
    server.use("/", express.static("./src/main/webapp/", cache1day));
    server.use("/libs", express.static("./libs", cache1day));
    server.use(CONFIG.explorerPrefix, setContentType, express.static(".", cache1day));
    server.get(CONFIG.explorerPrefix + "*", sendDirectory);
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
