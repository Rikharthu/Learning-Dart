void main(List<String> arguments) {
  var list = [1, 2, 3, 4, 5];
  print(list);
  print("list type is ${list.runtimeType}");
  list.add(6);
  list.add(7);
  print(list);
  list.removeAt(3);
  print(list);

  print("Third element is ${list.elementAt(3)}");
  print("Fourth element is ${list[4]}");
  // list.add("This is not a number"); ERROR

  for (num i in list) {
    print(i);
  }

  list.forEach((element) {
    print("($element)");
  });

  var list2=[10,10.1,120,"Hello"];
  for (var x in list2) {
    print(x);
  }

  var onlyString=new List<String>();
  onlyString.add("Hello");
  onlyString.add("World");
  // onlyString.add(13); // ERROR
}
