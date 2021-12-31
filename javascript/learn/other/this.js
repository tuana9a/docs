// THIS KEYWORD
// In a method, this refers to the owner object.

//	Default Binding
//		Alone, this refers to the global object (global object là "Window" kể cả trong "strict" mode)
//		In a function, this refers to the global object (cũng là "Window")
//		In a function, in strict mode, this is undefined (tức "strict" mode thì sẽ là undefinded)
//		In an event, this refers to the element that received the event (tức là chính cái thẻ mà bị tác động)
//		nếu biến mà khai báo bởi let sẽ không được tính là một property của obj

//	Explicity Binding
//		Methods like call(), apply(), bind() can refer this to any object (các phương thức này khiến this trỏ tới bất kì obj nào)
//		The call(), apply(), bind() methods are predefined JavaScript methods. (là các phương thức sẵn có)
//		They can both be used to call an object method with another object as argument. (gọi method của obj này nhưng truyền obj khác)
//		VD: call()
var person1 = {
    fullName: function () {
        return this.firstName + " " + this.lastName;
    },
};
var person2 = { firstName: "John", lastName: "Doe" };
person1.fullName.call(person2); //tức person2 dùng method của person1 nên return "John Doe"

//		VD: call()
var member = { name: "Quan Tien" };
function greeting(text1, text2) {
    console.log(`${text1}, ${this.name}. ${text2}.`);
}
greeting.call(member, "Hello", "Nice to meet you"); // return "Hello, Quan Tien. Nice to meet you."
// member gọi hàm greeting, hàm greeting sẽ thuộc về member và "Hello" và "Nice ..." là tham số truyền vào greeting

//		VD: apply()
var member = { name: "Quan Tien" };
function greeting(text1, text2) {
    console.log(`${text1}, ${this.name}. ${text2}.`);
}
greeting.apply(member, ["Hello", "Nice to meet you"]); // return "Hello, Quan Tien. Nice to meet you."
// chỉ khác call là truyền vào mảng các tham só của hàm được gọi
//		VD: bind()
var member = { name: "Quan Tien" };
function greeting(text1, text2) {
    console.log(`${text1}, ${this.name}. ${text2}.`);
}
var sayHi = greeting.bind(member, "Hello", "Nice to meet you");
sayHi(); // return "Hello, Quan Tien. Nice to meet you."
// chỉ khác call là trả về một hàm mới

//	Implicity Binding (hiểu ngầm)
//		VD:
function foo() {
    console.log(this.a);
}
var obj = {
    a: 2,
    foo1: foo,
};
obj.foo1(); //return 2
// nó tự hiểu foo khi được gọi thì thuộc obj nên this là obj
//		VD:
function foo() {
    console.log(this.a);
}
var obj2 = {
    a: 42,
    foo: foo,
};
var obj1 = {
    a: 2,
    obj2: obj2,
};
obj1.obj2.foo(); // return 42 this sẽ tham chiếu đến obj2 thay vì là obj1

// this trong function arrow sẽ có sự khác biệt so với trong function thường khi gọi 2 lần cụ thể là lúc load và lúc gọi thông qua button
