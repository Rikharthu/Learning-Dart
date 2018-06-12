const pi = 3.14;

void main(List<String> arguments) {
  // A final variable can be set only once; a const variable is a compile-time constant
  // *Instance variables can be final but not const.
  // *A final top-level or class variable is initialized the first time it’s used
  // *Const variables are implicitly final.

  final name = 'Bob'; // Without a type annotation
  // name = 'Alice';  // Uncommenting this causes an error
  final String nickname = 'Bobby';

  const bar = 1000000; // Unit of pressure (dynes/cm2)
  const double atm = 1.01325 * bar; // Standard atmosphere
  print(atm);

  for (var i = 1; i <= 10; i++) {
    print("Area of circle with radius $i is ${pi * i * i}");
  }
}
