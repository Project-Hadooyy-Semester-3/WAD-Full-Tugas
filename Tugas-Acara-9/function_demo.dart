// Acara 9: Pemrograman Dart II (Function)
// File: Tugas-Acara-9/function_demo.dart

// Contoh 1: Function sederhana tanpa return
void tampilkan() {
  print("Hello Peserta Bootcamp");
}

// Contoh 2: Function sederhana dengan return
int munculkanangka() {
  return 2;
}

// Contoh 3: Function dengan parameter
num kalikanDua(num angka) {
  return angka * 2;
}

// Contoh 4: Pengiriman parameter lebih dari satu
num kalikan(num x, num y) {
  return x * y;
}

// Contoh 5: Inisialisasi parameter dengan nilai default
void tampilkanangka(dynamic n1, {int s1 = 45}) {
  print(n1); // Hasil n1
  print(s1); // Hasil s1 default atau custom
}

// Anonymous Function (function disimpan dalam variable)
var functionPerkalian = (num angka1, num angka2) {
  return angka1 * angka2;
};

void main(List<String> args) {
  print("=== Acara 9: Function Demo ===");

  print("\n1. Function Sederhana Tanpa Return:");
  tampilkan();

  print("\n2. Function Sederhana Dengan Return:");
  print(munculkanangka());

  print("\n3. Function Dengan Parameter:");
  print(kalikanDua(6));

  print("\n4. Pengiriman Parameter Lebih Dari Satu:");
  print(kalikan(5, 6));

  print("\n5. Inisialisasi Parameter Dengan Nilai Default:");
  tampilkanangka(5);

  print("\n6. Anonymous Function:");
  print(functionPerkalian(5, 6));
}
