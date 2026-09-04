// Acara 10: Polimorfisme
// File: Tugas-7-oop/Tugas-Polymorism/main.dart

import 'bangun_datar.dart';
import 'lingkaran.dart';
import 'persegi.dart';
import 'segitiga.dart';

void main(List<String> args) {
  BangunDatar bangunDatar = BangunDatar();
  Persegi persegi = Persegi(4.0);
  Segitiga segitiga = Segitiga(3.0, 4.0); // Siku-siku 3, 4, 5
  Lingkaran lingkaran = Lingkaran(7.0);

  print("=== Demo Polimorfisme Bangun Datar ===");
  print("--- Bangun Datar Induk ---");
  print("Luas: ${bangunDatar.luas()}");
  print("Keliling: ${bangunDatar.keliling()}");

  print("\n--- Persegi (sisi: ${persegi.sisi}) ---");
  print("Luas: ${persegi.luas()}");
  print("Keliling: ${persegi.keliling()}");

  print("\n--- Segitiga Siku-Siku (alas: ${segitiga.alas}, tinggi: ${segitiga.tinggi}, sisi miring: ${segitiga.sisiMiring}) ---");
  print("Luas: ${segitiga.luas()}");
  print("Keliling: ${segitiga.keliling()}");

  print("\n--- Lingkaran (jari-jari: ${lingkaran.jariJari}) ---");
  print("Luas: ${lingkaran.luas()}");
  print("Keliling: ${lingkaran.keliling()}");

  print("\n--- Pemanggilan Polymorphic via List<BangunDatar> ---");
  List<BangunDatar> daftarBangun = [persegi, segitiga, lingkaran];
  for (var bangun in daftarBangun) {
    print("${bangun.runtimeType} -> Luas: ${bangun.luas()}, Keliling: ${bangun.keliling()}");
  }
}
