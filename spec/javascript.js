
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
