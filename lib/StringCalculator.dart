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
    List<int> nums = parts.where((num) => num.isNotEmpty).map(int.parse).toList();
    List<int> negatives = nums.where((num) => num < 0).toList();
    if (negatives.isNotEmpty) {
      throw Exception("negatives not allowed: ${negatives.join(', ')}");
    }
    nums = nums.where((num) => num <= 1000).toList();
    int sum = nums.fold(0, (a, b) => a + b);
    return sum;
  }
}
