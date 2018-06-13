void main(List<String> arguments) {
  // var animal=new Animal(); ERROR, Animal is an abstract class

  var jenny = new Person("Jenny", "Caucasian");
  jenny.breathe();
  jenny.makeNoise();

  IsFunny funny1 = new Comedian("Charley", "Chaplin");
  IsFunny funny2 = new TVShow("Comedy Club");

  funny1.makePeopleLaugh();
  funny2.makePeopleLaugh();

  Comedian chaplin = new Comedian("Charley", "Chaplin");
  IsFunny funny3 = chaplin;
  chaplin.makePeopleLaugh();
  print(funny3 == chaplin);
  // -> true
}

abstract class Animal {
  void breathe(); // an abstract method

  void makeNoise() {
    print("Making animal noises!");
  }
}

class Person implements Animal {
  String name, nationality;

  Person(this.name, this.nationality);

  @override
  void breathe() {
    print("Person breathing through nostrils!");
  }

  @override
  void makeNoise() {
    print("Person shouting");
  }
}

abstract class IsFunny {
  void makePeopleLaugh(); // abstract method
}

class TVShow implements IsFunny {
  String name;

  TVShow(this.name);

  @override
  void makePeopleLaugh() {
    print("TV show is funny and makes people laugh!");
  }
}

class Comedian extends Person implements IsFunny {
  Comedian(String name, String nationality) : super(name, nationality);

  @override
  void makePeopleLaugh() {
    print("Comedian making people laugh!");
  }
}
