class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;
    String delimiter = ",";
    if (numbers.startsWith("//")) {
      RegExp delimiterRegex = RegExp(r"//(.+)\n");
      Match? match = delimiterRegex.firstMatch(numbers);
      if (match != null) {
        delimiter = match.group(1)!;
        numbers = numbers.substring(match.end);
      }
    }
    List<String> parts = numbers.replaceAll("\n", delimiter).split(delimiter);
    int sum = parts.where((num) => num.isNotEmpty).map(int.parse).reduce((a, b) => a + b);
    return sum;
  }
}
