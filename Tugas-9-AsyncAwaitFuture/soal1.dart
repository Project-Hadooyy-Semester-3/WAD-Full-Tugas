// Acara 11: Synchronous to Asynchronous
// File: Tugas-9-AsyncAwaitFuture/soal1.dart

import 'dart:async';

class Human {
  String name = "nama character one piece";

  Future<void> getData({Duration delay = const Duration(seconds: 3)}) async {
    await Future.delayed(delay);
    name = "hilmy";
    print("get data [done]");
  }
}

Future<void> main(List<String> args) async {
  var h = Human();

  // Output synchronous pertama
  print("luffy");
  print("zoro");
  print("killer");
  print(h.name);

  // Proses asynchronous menunggu 3 detik
  await h.getData();
  print("name 3: ${h.name}");
}
