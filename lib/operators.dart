void main(List<String> arguments) {
  int x = 5;
  int y = 2;

  print(x / y);
  // -> 2.5
  print(x % y);
  // -> 1 (remainder)

  // Effective integer division
  print(x ~/ y); // as int
  // -> 2
}
