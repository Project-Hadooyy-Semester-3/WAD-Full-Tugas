// Acara 10: Mengubah Prosedural ke Class
// File: soal1/soal1.dart

class Segitiga {
  double setengah;
  double alas;
  double tinggi;

  Segitiga({
    this.setengah = 0.5,
    required this.alas,
    required this.tinggi,
  });

  double hitungLuas() {
    return setengah * alas * tinggi;
  }

  double get luas => hitungLuas();
}

void main(List<String> args) {
  final segitiga = Segitiga(alas: 20.0, tinggi: 30.0);
  print("Alas: ${segitiga.alas}");
  print("Tinggi: ${segitiga.tinggi}");
  print("Luas Segitiga: ${segitiga.luas}");
}
