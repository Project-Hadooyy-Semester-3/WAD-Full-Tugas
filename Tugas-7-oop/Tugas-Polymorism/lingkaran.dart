// Acara 10: Polimorfisme
// File: Tugas-7-oop/Tugas-Polymorism/lingkaran.dart

import 'bangun_datar.dart';

class Lingkaran extends BangunDatar {
  double jariJari;
  static const double pi = 3.14;

  Lingkaran(this.jariJari);

  @override
  double luas() {
    return pi * jariJari * jariJari;
  }

  @override
  double keliling() {
    return 2 * pi * jariJari;
  }
}
