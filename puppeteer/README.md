# puppeteer

## How to use profiles

[https://stackoverflow.com/questions/57623828/in-puppeteer-how-to-switch-to-chrome-window-from-default-profile-to-desired-prof/57662769#57662769](https://stackoverflow.com/questions/57623828/in-puppeteer-how-to-switch-to-chrome-window-from-default-profile-to-desired-prof/57662769#57662769)

## LaunchOptions Examples

basic

```json
{
  "slowMo": 10,
  "defaultViewport": {
    "width": 1920,
    "height": 1080
  },
}
```

visible

defaultViewport is set to null is important

```json
{
  "headless": false,
  "slowMo": 10,
  "defaultViewport": null
}
```

visible with google-chrome-stable

```json
{
  "slowMo": 10,
  "headless": false,
  "defaultViewport": null,
  "executablePath": "google-chrome-stable"
}
```

docker

```json
{
  "slowMo": 10,
  "defaultViewport": {
    "width": 1920,
    "height": 1080,
  },
  "executablePath": "google-chrome-stable",
  "args": ["--no-sandbox", "--disable-setuid-sandbox"],
}
```
