import 'dart:async';

class LyricItem {
  final int step;
  final String text;
  final Duration delay;
  final String timestamp;

  LyricItem({
    required this.step,
    required this.text,
    required this.delay,
    required this.timestamp,
  });
}

class AsyncService {
  // Acara 11: Human getData() One Piece
  Future<Map<String, dynamic>> fetchOnePieceData({
    Duration delay = const Duration(seconds: 3),
  }) async {
    final initialLogs = [
      "luffy",
      "zoro",
      "killer",
      "nama character one piece",
    ];

    await Future.delayed(delay);

    return {
      "initial": initialLogs,
      "status": "get data [done]",
      "finalName": "name 3: hilmy",
    };
  }

  // Acara 12 - Soal 2: Future.delayed tanpa async-await ("Life is never flat")
  Future<List<String>> getLifeSequence() {
    final completer = Completer<List<String>>();
    final List<String> results = [];

    results.add("Life");

    Future.delayed(const Duration(milliseconds: 700), () {
      results.add("is");
    }).then((_) {
      return Future.delayed(const Duration(milliseconds: 700), () {
        results.add("never flat");
        completer.complete(results);
      });
    });

    return completer.future;
  }

  // Acara 12 - Soal 3: Song Subtitle stream
  Stream<LyricItem> streamSongLyrics({bool fastMode = false}) async* {
    final d5 = fastMode ? const Duration(milliseconds: 300) : const Duration(seconds: 5);
    final d3 = fastMode ? const Duration(milliseconds: 200) : const Duration(seconds: 3);
    final d2 = fastMode ? const Duration(milliseconds: 150) : const Duration(seconds: 2);
    final d1 = fastMode ? const Duration(milliseconds: 100) : const Duration(seconds: 1);

    yield LyricItem(
      step: 0,
      text: "Ready. Sing",
      delay: Duration.zero,
      timestamp: "00:00",
    );

    await Future.delayed(d5);
    yield LyricItem(
      step: 1,
      text: "pernahkan kau merasa",
      delay: d5,
      timestamp: fastMode ? "+300ms" : "+5s",
    );

    await Future.delayed(d3);
    yield LyricItem(
      step: 2,
      text: "pernahkah kau merasa.....",
      delay: d3,
      timestamp: fastMode ? "+200ms" : "+3s",
    );

    await Future.delayed(d2);
    yield LyricItem(
      step: 3,
      text: "pernahkah kau merasa",
      delay: d2,
      timestamp: fastMode ? "+150ms" : "+2s",
    );

    await Future.delayed(d1);
    yield LyricItem(
      step: 4,
      text: "Hatimu hampa, pernahkan kau merasa hati mu kosong....",
      delay: d1,
      timestamp: fastMode ? "+100ms" : "+1s",
    );
  }
}
