import 'package:Learning_Dart/Learning_Dart.dart' as LD; // LD is handle
import 'dart:math' as math;

// If you don't specify 'as XYZ', then library methods will be reference without that 'XYZ.' part
// Otherwise name should be used

/**
 * main is an entry point
 */
main(List<String> arguments) {
  print('Hello world: ${LD.calculate()}!');
  print("Name is ${LD.getName()}");
  // LD._somePrivateFunction() ERROR

  print("Max is ${math.max(133, 771)}");
}
