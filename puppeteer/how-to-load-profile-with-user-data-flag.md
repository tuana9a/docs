# Okay, I found the reason.

[origin stack overflow answer](https://stackoverflow.com/questions/57623828/in-puppeteer-how-to-switch-to-chrome-window-from-default-profile-to-desired-prof/57662769#57662769)

But first i would like to add that the issue is not in puppeteer. <br>
The issue is how chromium flag **`--user-data-dir`** works <br>
and the way i expected it to work.

My understanding was that arg `--user-data-dir` <br>
is specified to change default dir for user data.

The default dir where chromium searches for user data is <br>
`%userprofile%\AppData\Local\Chromium\User Data`

but when arg `--user-data-dir` is used <br>
then it appends **`'\Default'`** to specific dir.

So it becomes `%userprofile%\AppData\Local\Chromium\User Data\Default` instead, <br>
which is a profile directory.

Hence there was no need of arg `--profile-directory`. <br>
But since I had used it, <br>
I also instructed chromium to consider using specific profile.

There is definitely some clash of args here which led to opening of 2 browsers. <br>
One with specified profile and another with default.

So what I did instead is:

I moved contents of directory <br>
`%userprofile%\AppData\Local\Chromium\User Data\Profile 1` <br>
to **`%userprofile%\AppData\Local\Chromium\User Data\Profile 1\Default`** <br>
I created `'Default'` Directory inside **`'Profile 1'`** directory before moving all stuffs.

Removed arg `--profile-directory` and <br>
set `--user-data-dir`=**`%userprofile%\AppData\Local\Chromium\User Data\Profile 1`**

Now, what chromium does is, <br>
it changes it to `%userprofile%\AppData\Local\Chromium\User Data\Profile 1`**`\Default`** <br>
This way I can use puppeteer to launch using desired profile.

Final Code:

```js
const browser = await puppeteer.launch({
	headless: false,
	executablePath: "C:/Program Files (x86)/Google/Chrome/Application/chrome.exe",
	defaultViewport: null, args: ['--start-maximized'],
	userDataDir: "./Google/Chrome/User Data/Profile 1"
});

const page = await browser.newPage();
await page.goto("https://www.facebook.com/");
await page.screenshot({ path: 'screenshot.png' });
```
