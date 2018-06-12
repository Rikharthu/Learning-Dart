import 'dart:async';

// TODO more info: https://www.dartlang.org/articles/language/await-async
void main(List<String> arguments) {
  var future = new Future(() => 13).then((x) => x * x).then((x) => print(x));

  foo() => 42; // Returns the value
  bar() async => 42; // async returns Future
  // Same as
  bar2() => new Future(() => 42);

  print(foo());
  bar().then((value) => print("bar(): $value"));
  bar2().then((value) => print("bar2(): $value"));

  printBar() async {
    // await can be called only inside async function
    var barResult = await bar();
    print("Bar result is $barResult");

    var greetingFuture = new Future(() => "Hello!");
    var greetings = await greetingFuture;
    print(greetings);
  }

  printBar();
}
