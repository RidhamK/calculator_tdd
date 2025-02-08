import 'package:flutter/material.dart';
import 'CalculatorScreen.dart';
import 'StringCalculator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final StringCalculator calculator = StringCalculator();

  test('Empty string should return 0', () {
    expect(calculator.add(""), 0);
  });

  test('Single number should return the number itself', () {
    expect(calculator.add("1"), 1);
    expect(calculator.add("5"), 5);
  });

  test('Two numbers should return their sum', () {
    expect(calculator.add("1,2"), 3);
    expect(calculator.add("10,20"), 30);
  });

  test('Multiple numbers should return their sum', () {
    expect(calculator.add("1,2,3,4,5"), 15);
    expect(calculator.add("10,20,30,40"), 100);
  });

  test('Numbers separated by new lines should be handled correctly', () {
    expect(calculator.add("1\n2,3"), 6);
    expect(calculator.add("4\n5\n6"), 15);
    expect(calculator.add("7,8\n9"), 24);
  });

  test('Support custom single-character delimiter', () {
    expect(calculator.add("//;\n1;2;3"), 6);
  });

  test('Support custom multi-character delimiter', () {
    expect(calculator.add("//***\n1***2***3"), 6);
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: const CalculatorScreen(),
    );
  }
}

