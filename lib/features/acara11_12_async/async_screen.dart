import 'dart:async';
import 'package:flutter/material.dart';
import 'async_service.dart';

class AsyncScreen extends StatefulWidget {
  const AsyncScreen({super.key});

  @override
  State<AsyncScreen> createState() => _AsyncScreenState();
}

class _AsyncScreenState extends State<AsyncScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final AsyncService _service = AsyncService();

  // State Acara 11 One Piece
  bool _isOnePieceLoading = false;
  List<String> _onePieceLogs = [];

  // State Acara 12 Life is never flat
  bool _isLifeLoading = false;
  List<String> _lifeWords = [];

  // State Acara 12 Subtitle Lagu
  bool _isSongPlaying = false;
  bool _fastMode = false;
  final List<LyricItem> _playedLyrics = [];
  StreamSubscription<LyricItem>? _lyricSubscription;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _lyricSubscription?.cancel();
    super.dispose();
  }

  void _runOnePieceSimulation() async {
    setState(() {
      _isOnePieceLoading = true;
      _onePieceLogs = [
        "luffy",
        "zoro",
        "killer",
        "nama character one piece",
        "Menunggu async getData() (3 detik)...",
      ];
    });

    final res = await _service.fetchOnePieceData(
      delay: const Duration(seconds: 3),
    );

    if (mounted) {
      setState(() {
        _isOnePieceLoading = false;
        _onePieceLogs = [
          ...res['initial'] as List<String>,
          res['status'] as String,
          res['finalName'] as String,
        ];
      });
    }
  }

  void _runLifeSimulation() async {
    setState(() {
      _isLifeLoading = true;
      _lifeWords = ["Life"];
    });

    final words = await _service.getLifeSequence();
    if (mounted) {
      setState(() {
        _isLifeLoading = false;
        _lifeWords = words;
      });
    }
  }

  void _playSongLyrics() {
    _lyricSubscription?.cancel();
    setState(() {
      _isSongPlaying = true;
      _playedLyrics.clear();
    });

    _lyricSubscription =
        _service.streamSongLyrics(fastMode: _fastMode).listen((lyric) {
      if (mounted) {
        setState(() {
          _playedLyrics.add(lyric);
          if (lyric.step == 4) {
            _isSongPlaying = false;
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Acara 11 & 12: Async, Future, Await"),
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: const Color(0xFF6C63FF),
          tabs: const [
            Tab(icon: Icon(Icons.timer), text: "One Piece Async"),
            Tab(icon: Icon(Icons.flash_on), text: "Life Is Never Flat"),
            Tab(icon: Icon(Icons.music_note), text: "Subtitle Lagu"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildOnePieceTab(theme),
          _buildLifeTab(theme),
          _buildSongLyricsTab(theme),
        ],
      ),
    );
  }

  // Tab 1: Acara 11 One Piece
  Widget _buildOnePieceTab(ThemeData theme) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.timer, color: Color(0xFF6C63FF)),
                    const SizedBox(width: 8),
                    Text(
                      "Acara 11: Synchronous to Asynchronous",
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  "Output saat compile pertama: luffy, zoro, killer, nama character one piece. Lalu 3 detik kemudian muncul: get data [done] dan name 3: hilmy.",
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
                const Divider(height: 24, color: Color(0xFF333852)),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: _isOnePieceLoading ? null : _runOnePieceSimulation,
                    icon: _isOnePieceLoading
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Icon(Icons.play_arrow),
                    label: Text(_isOnePieceLoading
                        ? "Menunggu 3 Detik..."
                        : "Jalankan Simulasi Asynchronous"),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF141724),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFF282D42)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Console Output Terminal:",
                        style: TextStyle(
                          color: Color(0xFF8C85FF),
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 8),
                      if (_onePieceLogs.isEmpty)
                        const Text(
                          "Belum dijalankan. Klik tombol di atas.",
                          style: TextStyle(
                            fontFamily: 'monospace',
                            color: Colors.grey,
                          ),
                        )
                      else
                        ..._onePieceLogs.map((log) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2.0),
                              child: Text(
                                "> $log",
                                style: TextStyle(
                                  fontFamily: 'monospace',
                                  fontSize: 14,
                                  color: log.contains("hilmy") || log.contains("done")
                                      ? const Color(0xFF10B981)
                                      : const Color(0xFFE2E8F0),
                                  fontWeight: log.contains("hilmy")
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                            )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Tab 2: Acara 12 Life is never flat
  Widget _buildLifeTab(ThemeData theme) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.flash_on, color: Color(0xFFF59E0B)),
                    const SizedBox(width: 8),
                    Text(
                      "Acara 12: Future Delayed Tanpa Async-Await",
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  "Mengurutkan output acak menjadi \"Life is never flat\" murni dengan Future.delayed dan chaining .then() tanpa async-await.",
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
                const Divider(height: 24, color: Color(0xFF333852)),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF59E0B),
                      foregroundColor: Colors.black,
                    ),
                    onPressed: _isLifeLoading ? null : _runLifeSimulation,
                    icon: _isLifeLoading
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.black,
                            ),
                          )
                        : const Icon(Icons.play_arrow),
                    label: Text(_isLifeLoading
                        ? "Menjalankan Delay..."
                        : "Jalankan Future.delayed Sequence"),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    alignment: WrapAlignment.center,
                    children: _lifeWords.map((word) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF6C63FF),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF6C63FF).withValues(alpha: 0.4),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Text(
                          word,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Tab 3: Acara 12 Subtitle Lagu
  Widget _buildSongLyricsTab(ThemeData theme) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.music_note, color: Color(0xFFEC4899)),
                    const SizedBox(width: 8),
                    Text(
                      "Subtitle Lagu (Async, Await & Future)",
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  "Urutan jeda: Ready. Sing -> 5s line() -> 3s line2() -> 2s line3() -> 1s line4().",
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Checkbox(
                      value: _fastMode,
                      activeColor: const Color(0xFFEC4899),
                      onChanged: (val) {
                        setState(() {
                          _fastMode = val ?? false;
                        });
                      },
                    ),
                    const Text("Mode Cepat (Demo instan ms untuk testing)"),
                  ],
                ),
                const Divider(height: 16, color: Color(0xFF333852)),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFEC4899),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: _isSongPlaying ? null : _playSongLyrics,
                    icon: _isSongPlaying
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Icon(Icons.play_circle_fill),
                    label: Text(_isSongPlaying
                        ? "Sedang Memainkan Lirik..."
                        : "Play Subtitle Lagu"),
                  ),
                ),
                const SizedBox(height: 16),
                ..._playedLyrics.map((item) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: item.step == 0
                          ? const Color(0xFF23273B)
                          : const Color(0xFF1E293B),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color(0xFFEC4899).withValues(alpha: 0.5),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEC4899).withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            item.timestamp,
                            style: const TextStyle(
                              color: Color(0xFFEC4899),
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            item.text,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: item.step == 0
                                  ? FontWeight.bold
                                  : FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
