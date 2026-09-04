// Acara 12: Async, Await dan Future Subtitle Lagu
// File: Tugas-9-AsyncAwaitFuture/soal3.dart

import 'dart:async';

Future<String> line({Duration delay = const Duration(seconds: 5)}) async {
  await Future.delayed(delay);
  const text = "pernahkan kau merasa";
  print(text);
  return text;
}

Future<String> line2({Duration delay = const Duration(seconds: 3)}) async {
  await Future.delayed(delay);
  const text = "pernahkah kau merasa.....";
  print(text);
  return text;
}

Future<String> line3({Duration delay = const Duration(seconds: 2)}) async {
  await Future.delayed(delay);
  const text = "pernahkah kau merasa";
  print(text);
  return text;
}

Future<String> line4({Duration delay = const Duration(seconds: 1)}) async {
  await Future.delayed(delay);
  const text = "Hatimu hampa, pernahkan kau merasa hati mu kosong....";
  print(text);
  return text;
}

Future<void> main(List<String> args) async {
  print("Ready. Sing");
  await line();
  await line2();
  await line3();
  await line4();
}
