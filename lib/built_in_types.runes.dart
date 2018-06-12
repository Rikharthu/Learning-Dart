void main(List<String> arguments) {
  // In Dart, runes are the UTF-32 code points of a string
  // (Strings in Dart use UTF-16)

  /*
  The usual way to express a Unicode code point is \uXXXX,
  where XXXX is a 4-digit hexidecimal value.
  For example, the heart character (♥) is \u2665.
  To specify more or less than 4 hex digits, place the value in curly brackets.
  For example, the laughing emoji (😆) is \u{1f600}.
   */

  var clapping = '\u{1f44f}';
  print(clapping);
  print(clapping.codeUnits); // extract 16-bit code-units
  print(clapping.runes.toList());

  Runes input = new Runes(
      '\u2665  \u{1f605}  \u{1f60e}  \u{1f47b}  \u{1f596}  \u{1f44d}');
  print(new String.fromCharCodes(input));

  // Reversing problem:
  var quote = "Music \u{1d11e} for the win"; // Music 𝄞 for the win
  print(quote);
  // Splitting with an empty string pattern ('') splits at
  // UTF-16 code unit boundaries and not at rune boundaries[.]
  print(quote.split(""));
  print(quote.runes.toList());
  print(new String.fromCharCodes(
      quote.runes.toList().reversed)); // niw eht rof 𝄞 cisuM
}
