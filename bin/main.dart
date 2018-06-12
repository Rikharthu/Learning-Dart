import 'package:Learning_Dart/Learning_Dart.dart' as Learning_Dart;

/**
 * main is an entry point
 */
main(List<String> arguments) {
  print('Hello world: ${Learning_Dart.calculate()}!');
  var doubleQuotesAllowed = true;
  // bool doubleQuotesAllowed = true;
  print("Double quotes are also allowed? $doubleQuotesAllowed");

  var dynamic;
  print(dynamic);
  // -> null
  dynamic = 13;
  print(dynamic);
  // -> 13
  dynamic = "Hello";
  print(dynamic);
  // -> "Hello"
  if(dynamic is String){
    print("\"$dynamic\" is String");
  }else if(dynamic is int){
    print("\"$dynamic\" is int");
  }
}
