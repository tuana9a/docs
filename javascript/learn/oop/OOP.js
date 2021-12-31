// OBJECT / CLASS

// 1. đối tượng
var clock = {
    name: "casio",
    age: 1994,
    showTime: () => console.log("It’s " + Date.now()),
    lightOn() {
        console.log("Light On");
    },
};

//		truy cập thuộc tính
clock.name; // đối_tượng.thuộc_tính
clock["name"]; // đối_tượng['thuộc_tính']

//		truy cập phương thức
clock.showTime(); // đối_tượng.phương_thức
clock["showTime"](); // đối_tượng['phương_thức']

/*
class
    tất cả việc khai báo ở trên chỉ cho một đối tượng, do vậy cần class
    khi sử dụng cần phải new mới thì mới sử dụng được
    không được hoisted thế nên cần khai báo trước khi sử dụng chúng
    cách khai báo một className
    VD:
 */

class Car {
    constructor(brand) {
        this.carname = brand;
    }
}
ford = new Car("Ford Ranger");

// getter và setter
// VD:
class Car {
    constructor(brand) {
        this._carname = brand;
    }
    get carname() {
        return this._carname;
    }
    set carname(x) {
        this._carname = x;
    }
}
ford = new Car("Ford");
ford.carname; // đây là getter tức lấy this._carname ra
ford.carname = "tuấn"; // đây là setter tức set this._carname = "tuấn"
//			chú ý getter và setter mang tiếng là hàm nhưng khi sử dụng thì lại không có "()" ở cuối

//	inheritance, để kế thừa một class dùng từ khóa extends
//			VD:
class Car {
    constructor(brand) {
        this.carname = brand;
    }
    present() {
        return "I have a " + this.carname;
    }
}

class Model extends Car {
    constructor(brand, mod) {
        super(brand);
        this.model = mod;
    }
    show() {
        return this.present() + ", it is a " + this.model;
    }
}
mycar = new Model("Ford", "Mustang");
mycar.show();

//	3. các thứ chưa nắm rõ
//***		không hiểu, nếu dùng for in cho đối tượng thì nó chỉ dùng đối_tượng[biến_for] để duyệt từng thuộc tính hoặc phương thức

//***		dùng thẳng constructor để khởi tạo một object
function Animal(name, act) {
    this.behave = function () {
        console.log(name + " " + act);
    };
}
var dog = Animal("chó", "cắn");
var cat = Animal("mèo", "cắn");
// như vậy dog và cat là 2 đối tượng hoàn toàn khác nhau

//***		tùy biến đối tượng
Object.defineProperty(đối_tượng, tên_thuộc_tính, { các_tính_chất });
//				để thay đổi thuộc tính đã có hoặc thêm mới thuộc tính nếu chưa có thuộc tính đó
//				VD: thêm mới một thuộc tính
Object.defineProperty(person, "language", {
    value: "EN", // có  thể là phương thức
    writable: true, // chịu
    enumerable: false, // false sẽ không dùng được trong forEach()
    configurable: true, // chịu
});

//				VD: define getter và setter cho chính thuộc tính đó
Object.defineProperty(person, "language", {
    get: function () {
        return language;
    },
    set: function (value) {
        language = value.toUpperCase(); // sẽ viết hoa tất rồi mới set giá trị
    },
});

Object.defineProperty(object, property, descriptor); // Adding or changing an object property
Object.defineProperties(object, descriptors); // Adding or changing many object properties
Object.getOwnPropertyDescriptor(object, property); // Accessing Properties
Object.getOwnPropertyNames(obj); // Returns all properties as an array
Object.keys(object); // Returns enumerable properties as an array
Object.values(obj); // Returns enumerable properties's value as an array
Object.getPrototypeOf(object); // Accessing the prototype
Object.preventExtensions(obj); // Prevents adding properties to an object
Object.isExtensible(object); // Returns true if properties can be added to an object
Object.seal(object); // Prevents changes of object properties (not values)
Object.isSealed(object); // Returns true if object is sealed
Object.freeze(object); // Prevents any changes to an object
Object.isFrozen(object); // Returns true if object is frozen
