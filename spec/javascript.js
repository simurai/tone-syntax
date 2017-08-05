
var Sales = "Toyota";

function CarTypes(name) {
  if (name == "Honda") {
    return name;
  } else {
    return "Sorry, we don't sell " + name + ".";
  }
}

var car = { myCar: "Saturn", getCar: CarTypes("Honda"), special: Sales };

console.log(car.special);

// ES6 ---------------------------

const templateString = `${car.myCar} is a ${Sales} yay`;

const obj = {
  [myKey]: 'val',
  method(x, y) {
    return x ** y;
  },
  ...(foo ? obj1 : obj2)
}

class MyClass extends BaseClass {
  constructor(...args) {
    super(...args);

    this.foo = args.foo;
  }

  fooMethod(bar = 'defaultValue', { items, baz: qux, ...rest, }) {
    this.arr = [...items];

    return this.arr.map(x => x * 2);
  }
}


// 2. Tests ----------------------


return {
  restrict: 'E',
  transclude: true,
  transclude: false,
  scope: {
    options: '='
  },
  templateUrl: 'js/...',
  controllerAs: 'vm',
  bindToController: true,
  controller: function (NgTableParams, TABLE_OPTIONS_FIELD) {
    var vm = this;
  }
};
