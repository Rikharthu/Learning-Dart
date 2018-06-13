void main(List<String> arguments) {
  var person = {
    // key : value
    "name": "John",
    "age": 13,
    "height": 181.3
  };
  print(person);
  print(person["name"]);

  person.forEach((key,value){
    print("key: $key, value: $value");
  });

  for(var element in person.values){
    if(element is int){
      print("next value is an integer");
    }
    print("value is $element");
  }

  // Iterate over keys
  for(var key in person.keys){
    print("key is $key");
  }
}
