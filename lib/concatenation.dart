void main(List<String> arguments) {
  String firstName = "James";
  String lastName = "Bond";
  int age = 45;

  print("$firstName $lastName is $age years old");
  print(firstName + " " + lastName + " is " + age.toString() + " years old");

  print("Hello there $firstName ${lastName.toUpperCase()}");
}
