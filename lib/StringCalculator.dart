class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;
    String delimiter = ",";
    List<String> parts = numbers.replaceAll("\n", delimiter).split(delimiter);
    int sum = 0;

    for (String num in parts) {
      sum += int.parse(num);
    }

    return sum;
  }
}
