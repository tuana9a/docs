// lấy 1 chữ cuối
"string".slice(-1); 

// bỏ 1 chữ cuối
"string".slice(0, -1);

// bỏ 1 chữ đầu
"string".slice(1);

const element = document.createElement("div");
// collection các element con
element.children;


// ngược lên gần nhất, (.querySelector là xuôi)
element.closest(_selector_);

// check element mà liên quan tới event
element.addEventListener("click", (e) => {
    e.target.matches(".dropdown-button span");
});

const date = new Date();
date.getDay; //:  day-of-week
date.getDate; //: day-of-month
