// Go to https://to-do.office.com/tasks/inbox then paste these commands

let sleepTime = 100;
let deleteCount = 50;

const sleep = (ms) => new Promise(resolve => setTimeout(resolve, ms));

const deleteAll = async () => {
    for (let i = 0; i < deleteCount; i++) {
        document.getElementsByClassName("taskItem-titleWrapper")[0].click()
        await sleep(sleepTime);
        document.getElementsByClassName("detailFooter-trash")[0].click()
        await sleep(sleepTime);
        document.getElementsByClassName("button red")[0].click()
        await sleep(sleepTime);
    }
}

let e = document.getElementsByClassName("taskItem-titleWrapper")[0];
while (e) {
    e.click()
    await sleep(sleepTime);
    document.getElementsByClassName("detailFooter-trash")[0].click()
    await sleep(sleepTime);
    document.getElementsByClassName("button red")[0].click()
    await sleep(sleepTime);
    e = document.getElementsByClassName("taskItem-titleWrapper")[0];
}