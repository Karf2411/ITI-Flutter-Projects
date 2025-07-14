import 'dart:io';

class InputHelper {
  static String getString(String prompt) {
    stdout.write(prompt);
    String? input = stdin.readLineSync();
    return input?.trim() ?? '';
  }

  static int? getInt(String prompt) {
    stdout.write(prompt);
    String? input = stdin.readLineSync();
    return int.tryParse(input ?? '');
  }

  static bool getYesNo(String prompt) {
    while (true) {
      stdout.write('$prompt (yes/no): ');
      String? input = stdin.readLineSync()?.toLowerCase().trim();
      if (input == 'yes') return true;
      if (input == 'no') return false;
      print('Please enter yes or no.');
    }
  }

  static List<int> getIntList(String prompt) {
    stdout.write(prompt);
    String? input = stdin.readLineSync();
    if (input == null || input.trim().isEmpty) return [];
    return input
        .split(',')
        .map((e) => int.tryParse(e.trim()))
        .whereType<int>()
        .toList();
  }
}
