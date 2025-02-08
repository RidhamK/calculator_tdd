class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    List<String> parts = numbers.split(',');
    int sum = 0;

    for (String num in parts) {
      sum += int.parse(num);
    }

    return sum;
  }
}
