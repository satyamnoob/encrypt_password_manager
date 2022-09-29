import 'dart:math';

String generateStrongPassword({
  bool isLetter = true,
  bool isNumber = true,
  bool isSpecial = true,
  required int lengthOfPassword,
}) {
  final length = lengthOfPassword;
  const letterLowerCase = "abcdefghijklmnopqrstuvwxyz";
  const letterUpperCase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  const number = '0123456789';
  const special = '@#%^*>\$@?/[]=+';

  String chars = "";
  if (isLetter) chars += '$letterLowerCase$letterUpperCase';
  if (isNumber) chars += number;
  if (isSpecial) chars += special;
  final generatedString = List.generate(length, (index) {
    final indexRandom = Random.secure().nextInt(chars.length);
    return chars[indexRandom];
  }).join('');

  return generatedString;
}

int generateRandomRoundsForCrypt() {
  final random = Random.secure();
  int min = 10000;
  int max = 100000;
  final rounds = min + random.nextInt(max - min);
  // print("Rounds ------------------>$rounds");
  return rounds;
}
