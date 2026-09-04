// Acara 10: Enkapsulasi
// File: Tugas-7-oop/Tugas-Enkapsulasi/main.dart

import 'lingkaran.dart';

void main(List<String> args) {
  Lingkaran lingkaran = Lingkaran();

  print("=== Demo Enkapsulasi Lingkaran ===");
  // Test nilai negatif (akan dikalikan -1 sehingga jadi positif)
  lingkaran.jariJari = -7.0;
  print("Input nilai: -7.0");
  print("Hasil jari-jari setelah validasi: ${lingkaran.jariJari}");
  print("Luas Lingkaran: ${lingkaran.luas}");

  // Test nilai positif
  lingkaran.setJariJari(10.0);
  print("\nInput nilai via method: 10.0");
  print("Hasil jari-jari: ${lingkaran.getJariJari()}");
  print("Luas Lingkaran: ${lingkaran.luas}");
}
