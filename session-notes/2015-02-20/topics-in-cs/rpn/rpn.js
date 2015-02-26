// var RPN = {
//   "OPERATORS": {

//   },
//   "Expression": function() {
//     return {
//       evaluate: function(){}
//     }
//   }
// };

// (new RPN.Expression("3 4 -")).evaluate();


var OPERATORS = {
  "+": "+",
  "-": "-",
  "*": "*",
  "/": "/",
  "%": "%"
};

// use regex? //slower than hash table

// empty string is false
// typeof "" is string
var rpn = function rpn(string, stack) {
  console.log(string, typeof string);
  console.log("stack:", stack);
  var args = typeof string === "string" ? string.split(" ") : string;
  var count = args.length;
  if (!stack) {
    var stack = [];
    console.log("no stack. created empty stack")
  }

  if ( (typeof string === 'object' || !string.length) && !stack.length) {
    console.log("if branch");
    return null;
  } else if ((typeof string === 'object' || !string.length) && stack.length === 1) {
    console.log("first else if branch");
    console.log("stack:", stack);
    console.log("stack[0]", stack[0]);
    return stack[0]; //undefined why?!!!
  } else {
    console.log("second else if branch");

    var arg = args.shift();
    if (OPERATORS[arg]) {
      console.log("operator")
      var right = stack.pop();
      var left = stack.pop();
      var calculatedValue = eval(left.concat(arg).concat(right));
      console.log("left:", left, "operator:", arg, "right:", right, "calculatedValue:", calculatedValue);
      stack.push((calculatedValue).toString());
      rpn(args, stack);
    } else {
      // assuming it is a typeof "number"
      stack.push(arg);
      args = args.join(" ");
      rpn(args, stack);
    }
  }
};
