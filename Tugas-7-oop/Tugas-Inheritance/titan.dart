// Acara 10: Inheritance
// File: Tugas-7-oop/Tugas-Inheritance/titan.dart

class Titan {
  double _powerPoint = 5.0;

  double get powerPoint => _powerPoint;

  set powerPoint(double value) {
    if (value < 5) {
      _powerPoint = 5.0;
    } else {
      _powerPoint = value;
    }
  }
}
