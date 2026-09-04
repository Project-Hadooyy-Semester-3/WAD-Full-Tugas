// Service untuk mendemonstrasikan fungsi-fungsi pada Acara 9
class FunctionService {
  // Contoh 1: Function sederhana tanpa return
  String tampilkan() {
    return "Hello Peserta Bootcamp";
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
  Map<String, dynamic> tampilkanangka(dynamic n1, {int s1 = 45}) {
    return {
      "n1": n1,
      "s1": s1,
    };
  }

  // Anonymous Function
  num anonymousKali(num angka1, num angka2) {
    // ignore: prefer_function_declarations_over_variables
    var perkalian = (num a, num b) => a * b;
    return perkalian(angka1, angka2);
  }
}
