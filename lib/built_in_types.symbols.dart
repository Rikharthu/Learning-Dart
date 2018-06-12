void main(List<String> arguments) {
  // Symbol literals are compile-time constants.
  var sym1 = #radix;
  print(sym1);
  print(sym1.runtimeType);
}
