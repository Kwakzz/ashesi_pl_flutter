/// Get last word from string
String getLastWord (String string) {
  List<String> words = string.split('-');

  String lastWord = words.isNotEmpty ? words.last : '';

  return lastWord;
}

/// Capitalize string
String capitalize (String string) {
  return string[0].toUpperCase() + string.substring(1);
}