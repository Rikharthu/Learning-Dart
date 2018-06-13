// More info:
// https://www.dartlang.org/guides/language/language-tour#functions
// https://www.dartlang.org/articles/language/emulating-functions

bool topLevel = true;

void main(List<String> arguments) {
  sayHello("John");
  print("Is John old? ${isOld(67)}");

  // enableFlags(true,false); ERROR
  enableFlags(bold: true);
  enableFlags(hidden: false, bold: true);

  print(say("John", "Hello"));
  print(say("Betty", "Goodbye", "iPhone"));

  enableSettings("Rikharthu", sync: true);
  print(pm("Admin", "Hello"));

  doStuff();

  // Functions as first-class objects
  print(print);
  // -> Closure: (Object) => void from Function 'print': static.
  var list = [1, 2, 3];

  // Pass printElement as a parameter.
  list.forEach(print);

  // You can also assign a function to a variable, such as:
  var loudify = (msg) => '!!! ${msg.toUpperCase()} !!!';
  assert(loudify('hello') == '!!! HELLO !!!');

  // Anonymous functions (lambda, closure)
  /*
  ([[Type] param1[, …]]) {
    codeBlock;
  };
   */
  var food = ['apples', 'bananas', 'oranges'];
  food.forEach((item) {
    print('${food.indexOf(item)}: $item');
  });

  // If the function contains only one statement, you can shorten
  // it using fat arrow notation.
  // Paste the following line into DartPad and click run to verify
  // that it is functionally equivalent.
  list.forEach((item) => print('${list.indexOf(item)}: $item'));

  // Lexical scope
  var insideMain = true;

  void myFunction() {
    var insideFunction = true;

    void nestedFunction() {
      var insideNestedFunction = true;

      assert(topLevel);
      assert(insideMain);
      assert(insideFunction);
      assert(insideNestedFunction);
    }
  }

  // Lexical closures
  // A closure is a function object that has access to variables in its lexical scope,
  // even when the function is used outside of its original scope.
  // Functions can close over variables defined in surrounding scopes.

  // In the following example, makeAdder() captures the variable addBy.
  // Wherever the returned function goes, it remembers addBy.

  // Create a function that adds 2.
  var add2 = makeAdder(2);

  // Create a function that adds 4.
  var add4 = makeAdder(4);

  assert(add2(3) == 5);
  assert(add4(3) == 7);

  var outsideVar = "Bond";
  insideFunction() {
    print("From inside: $outsideVar");
    outsideVar = "James";
  }
  print("Outside: $outsideVar");
  // -> Bond
  insideFunction();
  // -> Bound
  print("Outside: $outsideVar");
  // -> James
  outsideVar="Alex";
  insideFunction();
  // -> Alex
}

/// Returns a function that adds [addBy] to the
/// function's argument.
Function makeAdder(num addBy) {
  return (num i) => addBy + i;
}

void sayHello(name) {
  print("Hello, $name!");
}

// The => expr syntax is a shorthand for { return expr; }.
// The => notation is sometimes referred to as fat arrow syntax.
bool isOld(int age) => age >= 65;

// => expr =={return expression; }
String getName() => "James Bond";

// Optional parameters
// Can be either positional OR named

// Named:
void enableFlags({bool bold, bool hidden}) {
  // Unspecified parameters will be 'null'
  print("bold: $bold\nhidden: $hidden");
}

// Positional:
String say(String from, String msg, [String device]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  return result;
}

// You can specify default param values for both optional parameter types
void enableSettings(String user,
    {int delay = 15, bool sync = false, username = "root"}) {
  print(
      "Enabling settings for $user.\n\tdelay: $delay,\n\tsync: $sync,\n\tusername: $username");
}

String pm(String from, String msg,
    [String device = 'carrier pigeon', String mood]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  if (mood != null) {
    result = '$result (in a $mood mood)';
  }
  return result;
}

// You can also pass lists or maps as default values.
// The following example defines a function, doStuff(),
// that specifies a default list for the list parameter
// and a default map for the gifts parameter.
void doStuff(
    {List<int> list = const [1, 2, 3],
    Map<String, String> gifts = const {
      'first': 'paper',
      'second': 'cotton',
      'third': 'leather'
    }}) {
  print('list:  $list');
  print('gifts: $gifts');
}
