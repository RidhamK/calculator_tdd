class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;
    String delimiter = ",";
    List<String> parts = numbers.replaceAll("\n", delimiter).split(delimiter);
    int sum = parts.where((num) => num.isNotEmpty).map(int.parse).reduce((a, b) => a + b);
    return sum;
  }
}
