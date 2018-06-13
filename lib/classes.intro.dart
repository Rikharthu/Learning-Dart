/*
Dart is an object-oriented language with classes and mixin-based inheritance.
- Every object is an instance of a class
- All classes descend from Object.
- Subclasses don’t inherit constructors from their superclass.
  A subclass that declares no constructors has only the default
  (no argument, no name) constructor.
  
  More info:
  https://www.dartlang.org/guides/language/language-tour#classes

 */

void main(List<String> arguments) {
  var mic = new Microphone();
  mic.name = "Blue Yeti";
  mic.color = "Silver Gray";
  mic.model = 1345;

  var p1 = new Point(1, 2);
  // Using named constructor
  var p2 = new Point.origin();

  var emp = new Employee.fromJson({});

  var logger = new Logger('UI');
  logger.log('Button clicked');

  var person = new Person.fromJson({"name": "John"});
  person.greet();
  var impostor=new Impostor();
  impostor.greet();
}

class Microphone {
  String name;
  String color;
  int model;
}

class Point {
  num x;
  num y;
  num z = 0;

  Point(num x, num y) {
    this.x = x;
    this.y = y;
  }

// Syntactic sugar, same as above:
// Point(this.x, this.y);

  // Named constructor
  Point.origin() {
    x = 0;
    y = 0;
  }

  // Using Initializer list
  // - doesn't have access to 'this'
  Point.fromJson(Map<String, num> json)
      : x = json["x"],
        y = json["y"] {
    print("In point.fromJson(): ($x, $y)");
  }

  // You can validate input using assert
//  Point.withAssert(this.x, this.y) : assert(x >= 0) {
//    print('In Point.withAssert(): ($x, $y)');
//  }
  Point.alongXAxis(num x) : this(x, 0);
}

class Person {
  final String _firstName;

  Person.fromJson(Map data) : _firstName = data["name"] {
    print('in Person');
  }

  void greet() {
    print("Hello, my name is $_firstName!");
  }
}

class Employee extends Person {
  // Person does not have a default constructor;
  // you must call super.fromJson(data).
  Employee.fromJson(Map data) : super.fromJson(data) {
    print('in Employee');
  }


}

/*
If your class produces objects that never change,
you can make these objects compile-time constants.

To do this, define a const constructor and 
make sure that all instance variables are final.
*/
class ImmutablePoint {
  static final ImmutablePoint or = const ImmutablePoint(0, 0);
  final num x, y;

  const ImmutablePoint(this.x, this.y);
}

/*
Factory constructors
*/
class Logger {
  final String name;
  bool mute = false;

  // _cache is library-private, thanks to
  // the _ in front of its name.
  static final Map<String, Logger> _cache = <String, Logger>{};

  // 'factory' keyword before constructor name
  factory Logger(String name) {
    // No access to 'this'
    if (_cache.containsKey(name)) {
      return _cache[name];
    } else {
      final logger = new Logger._internal(name);
      _cache[name] = logger;
      return logger;
    }
  }

  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) print(msg);
  }
}

class Rectangle {
  num left, top, width, height;

  Rectangle(this.left, this.top, this.width, this.height);

  // Define two calculated properties: right and bottom
  num get right => left + width;

  set right(num value) => left = value - width;

  // { expr } also allowed instead of => expr
  num get bottom {
    return top + height;
  }

  set bottom(num value) => top = value - height;

  num calculateArea() => width * height;
}

// Abstract methods and classes
abstract class Doer {
  // Define instance variables and methods...

  void doSomething(); // Define an abstract method.
}

class EffectiveDoer extends Doer {
  void doSomething() {
    // Provide an implementation, so the method is not abstract here...
  }
}

// Override operators
class Vector {
  final int x, y;

  const Vector(this.x, this.y);

  /// Overrides + (a + b).
  Vector operator +(Vector v) {
    return new Vector(x + v.x, y + v.y);
  }

  /// Overrides - (a - b).
  Vector operator -(Vector v) {
    return new Vector(x - v.x, y - v.y);
  }
}

class Impostor implements Person {
  get _firstName => '';

  @override
  void greet() {
    print("Hello. I am impostor, thus my name is '$_firstName'");
  }
}
