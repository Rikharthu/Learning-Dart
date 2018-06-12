void main(List<String> arguments) {
  // num: 'integer' or 'double'
  num age = 13;
  num progress = 99.9;

  print(age);
  print(age.runtimeType);

  print(progress);
  print(progress.runtimeType);

  int x = 1;
  int hex = 0xDEADBEEF;

  double exponents = 1.42e5;

  // String -> int
  var one = int.parse('1');
  assert(one == 1);

  // String -> double
  var onePointOne = double.parse('1.1');
  assert(onePointOne == 1.1);

  // int -> String
  String oneAsString = 1.toString();
  assert(oneAsString == '1');

  // double -> String
  String piAsString = 3.14159.toStringAsFixed(2);
  assert(piAsString == '3.14');

  assert((3 << 1) == 6); // 0011 << 1 == 0110
  assert((3 >> 1) == 1); // 0011 >> 1 == 0001
  assert((3 | 4) == 7); // 0011 | 0100 == 0111

  // Literal numbers are compile-time constants.
  // Many arithmetic expressions are also compile-time constants,
  // as long as their operands are compile-time constants that evaluate to numbers.
  const msPerSecond = 1000;
  const secondsUntilRetry = 5;
  const msUntilRetry = secondsUntilRetry * msPerSecond;
}
