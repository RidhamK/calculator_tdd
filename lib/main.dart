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

