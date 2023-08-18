String gsb(String text, String start, String end) {
  final startIndex = text.indexOf(start);
  if (startIndex == -1) {
    return ''; // Start string not found
  }

  final endIndex = text.indexOf(end, startIndex + start.length);
  if (endIndex == -1) {
    return ''; // End string not found
  }

  return text.substring(startIndex + start.length, endIndex);
}
