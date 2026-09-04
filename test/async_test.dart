import 'package:flutter_test/flutter_test.dart';

import '../Tugas-9-AsyncAwaitFuture/soal1.dart';
import '../Tugas-9-AsyncAwaitFuture/soal3.dart';

void main() {
  group('Acara 11 & 12: Async, Await & Future Tests', () {
    test('1. Acara 11: Human getData() updates name to hilmy asynchronously', () async {
      final human = Human();
      expect(human.name, equals("nama character one piece"));

      // Test with small duration for fast automated testing
      await human.getData(delay: const Duration(milliseconds: 50));
      expect(human.name, equals("hilmy"));
    });

    test('2. Acara 12: Subtitle lyrics return expected lyrics in order', () async {
      const fastDelay = Duration(milliseconds: 10);

      final l1 = await line(delay: fastDelay);
      expect(l1, equals("pernahkan kau merasa"));

      final l2 = await line2(delay: fastDelay);
      expect(l2, equals("pernahkah kau merasa....."));

      final l3 = await line3(delay: fastDelay);
      expect(l3, equals("pernahkah kau merasa"));

      final l4 = await line4(delay: fastDelay);
      expect(l4, equals("Hatimu hampa, pernahkan kau merasa hati mu kosong...."));
    });
  });
}
