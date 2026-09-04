// Master Runner: Menjalankan semua tugas BKPM sekaligus secara berurutan
// File: run_all.dart

import 'Tugas-Acara-9/function_demo.dart' as acara9;
import 'soal1/soal1.dart' as soal1;
import 'Tugas-7-oop/Tugas-Enkapsulasi/main.dart' as enkapsulasi;
import 'Tugas-7-oop/Tugas-Inheritance/main.dart' as inheritance;
import 'Tugas-7-oop/Tugas-Polymorism/main.dart' as polymorphism;
import 'Tugas-7-oop/Tugas-Constructor/main.dart' as constructor;
import 'Tugas-9-AsyncAwaitFuture/soal1.dart' as async_soal1;
import 'Tugas-9-AsyncAwaitFuture/soal2.dart' as async_soal2;
import 'Tugas-9-AsyncAwaitFuture/soal3.dart' as async_soal3;

void printHeader(String title) {
  print("\n==================================================");
  print("[+] $title");
  print("==================================================");
}

Future<void> main() async {
  print("==================================================");
  print("      RUN ALL TUGAS BKPM DART & OOP (HADI)        ");
  print("==================================================");

  // 1. Acara 9: Functions
  printHeader("ACARA 9: Pemrograman Dart II (Function)");
  acara9.main([]);

  // 2. Acara 10: OOP
  printHeader("ACARA 10: 1. Mengubah Prosedural ke Class Segitiga");
  soal1.main([]);

  printHeader("ACARA 10: 2. Enkapsulasi Lingkaran (Validasi Minus)");
  enkapsulasi.main([]);

  printHeader("ACARA 10: 3. Inheritance Attack on Titan");
  inheritance.main([]);

  printHeader("ACARA 10: 4. Polimorfisme Bangun Datar");
  polymorphism.main([]);

  printHeader("ACARA 10: 5. Constructor Employee");
  constructor.main([]);

  // 3. Acara 11: Async & Sync
  printHeader("ACARA 11: Asynchronous One Piece (Delay 3s)");
  await async_soal1.main([]);

  // 4. Acara 12: Future delayed
  printHeader("ACARA 12: 1. Future.delayed 'Life is never flat'");
  async_soal2.main([]);
  // Berikan jeda 2.2 detik agar output soal 2 selesai sebelum soal 3
  await Future.delayed(const Duration(milliseconds: 2200));

  printHeader("ACARA 12: 2. Subtitle Lagu (Karaoke Timer)");
  await async_soal3.main([]);

  print("\n==================================================");
  print("[SUCCESS] SEMUA TUGAS BKPM BERHASIL DIJALANKAN!");
  print("==================================================\n");
}
