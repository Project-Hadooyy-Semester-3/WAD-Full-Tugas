// Acara 10: Enkapsulasi
// File: Tugas-7-oop/Tugas-Enkapsulasi/lingkaran.dart

class Lingkaran {
  double _jariJari = 0.0;
  static const double _pi = 3.14;

  // Method setter dengan validasi jika nilai negatif dikali -1
  void setJariJari(double value) {
    if (value < 0) {
      _jariJari = value * -1;
    } else {
      _jariJari = value;
    }
  }

  // Method getter
  double getJariJari() => _jariJari;

  // Property setter dengan validasi yang sama
  set jariJari(double value) {
    if (value < 0) {
      _jariJari = value * -1;
    } else {
      _jariJari = value;
    }
  }

  // Property getter
  double get jariJari => _jariJari;

  // Getter luas lingkaran
  double get luas => _pi * _jariJari * _jariJari;

  double hitungLuas() => luas;
}
