// Acara 10: Polimorfisme
// File: Tugas-7-oop/Tugas-Polymorism/segitiga.dart

import 'dart:math';
import 'bangun_datar.dart';

class Segitiga extends BangunDatar {
  double alas;
  double tinggi;
  late double sisiMiring;

  Segitiga(this.alas, this.tinggi, [double? c]) {
    sisiMiring = c ?? sqrt((alas * alas) + (tinggi * tinggi));
  }

  @override
  double luas() {
    return 0.5 * alas * tinggi;
  }

  // Segitiga siku-siku: keliling = a + b + t (sisi alas + tinggi + sisi miring)
  @override
  double keliling() {
    return alas + tinggi + sisiMiring;
  }
}
