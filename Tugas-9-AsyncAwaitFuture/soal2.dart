// Acara 12: Future Delayed tanpa async await
// File: Tugas-9-AsyncAwaitFuture/soal2.dart

void main(List<String> args) {
  // Mencetak "Life is never flat" menggunakan Future.delayed tanpa async-await
  print("Life");

  Future.delayed(const Duration(seconds: 1), () {
    print("is");
  }).then((_) {
    return Future.delayed(const Duration(seconds: 1), () {
      print("never flat");
    });
  });
}
