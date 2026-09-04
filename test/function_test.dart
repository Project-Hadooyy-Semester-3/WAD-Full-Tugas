import 'package:flutter_test/flutter_test.dart';
import '../Tugas-Acara-9/function_demo.dart';

void main() {
  group('Acara 9: Function Unit Tests', () {
    test('1. munculkanangka returns 2', () {
      expect(munculkanangka(), equals(2));
    });

    test('2. kalikanDua doubles the input', () {
      expect(kalikanDua(6), equals(12));
      expect(kalikanDua(3.5), equals(7.0));
    });

    test('3. kalikan multiplies two numbers', () {
      expect(kalikan(5, 6), equals(30));
      expect(kalikan(4, 2.5), equals(10.0));
    });

    test('4. functionPerkalian anonymous function multiplies numbers', () {
      expect(functionPerkalian(5, 6), equals(30));
      expect(functionPerkalian(8, 9), equals(72));
    });
  });
}
