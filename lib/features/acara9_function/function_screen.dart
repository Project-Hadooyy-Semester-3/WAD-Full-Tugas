import 'package:flutter/material.dart';
import 'function_service.dart';

class FunctionScreen extends StatefulWidget {
  const FunctionScreen({super.key});

  @override
  State<FunctionScreen> createState() => _FunctionScreenState();
}

class _FunctionScreenState extends State<FunctionScreen> {
  final FunctionService _service = FunctionService();

  final TextEditingController _singleNumController =
      TextEditingController(text: "6");
  final TextEditingController _paramXController =
      TextEditingController(text: "5");
  final TextEditingController _paramYController =
      TextEditingController(text: "6");
  final TextEditingController _n1Controller =
      TextEditingController(text: "5");
  final TextEditingController _s1Controller =
      TextEditingController(text: "45");

  bool _useDefaultS1 = true;
  String _outputLog = "Tekan tombol di bawah untuk menguji setiap fungsi.";

  void _log(String message) {
    setState(() {
      _outputLog = message;
    });
  }

  @override
  void dispose() {
    _singleNumController.dispose;
    _paramXController.dispose;
    _paramYController.dispose;
    _n1Controller.dispose;
    _s1Controller.dispose;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Acara 9: Dart Functions"),
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildLogCard(theme),
          const SizedBox(height: 16),
          _buildSectionHeader("1 & 2. Fungsi Dasar"),
          _buildBasicFunctionsCard(),
          const SizedBox(height: 16),
          _buildSectionHeader("3. Fungsi Satu Parameter (kalikanDua)"),
          _buildSingleParamCard(),
          const SizedBox(height: 16),
          _buildSectionHeader("4 & 6. Fungsi Multi Parameter & Anonymous"),
          _buildMultiParamCard(),
          const SizedBox(height: 16),
          _buildSectionHeader("5. Parameter Default (tampilkanangka)"),
          _buildDefaultParamCard(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 4.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Color(0xFF8C85FF),
        ),
      ),
    );
  }

  Widget _buildLogCard(ThemeData theme) {
    return Card(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              const Color(0xFF6C63FF).withValues(alpha: 0.15),
              const Color(0xFF1A1D2B),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.terminal, color: Color(0xFF6C63FF), size: 20),
                const SizedBox(width: 8),
                Text(
                  "Output Console Log",
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF6C63FF),
                  ),
                ),
              ],
            ),
            const Divider(height: 20, color: Color(0xFF333852)),
            SelectableText(
              _outputLog,
              style: const TextStyle(
                fontFamily: 'monospace',
                fontSize: 13,
                color: Color(0xFFE2E8F0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBasicFunctionsCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                  final res = _service.tampilkan();
                  _log("Function 1 (Tanpa Return):\ntampilkan() -> \"$res\"");
                },
                icon: const Icon(Icons.message, size: 18),
                label: const Text("tampilkan()"),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                  final res = _service.munculkanangka();
                  _log("Function 2 (Dengan Return):\nmunculkanangka() -> $res");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3B82F6),
                ),
                icon: const Icon(Icons.pin, size: 18),
                label: const Text("angka() -> 2"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSingleParamCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _singleNumController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Nilai Angka",
                  prefixIcon: Icon(Icons.numbers),
                ),
              ),
            ),
            const SizedBox(width: 12),
            ElevatedButton(
              onPressed: () {
                final val = double.tryParse(_singleNumController.text) ?? 0;
                final res = _service.kalikanDua(val);
                _log("kalikanDua($val)\nHasil = $res");
              },
              child: const Text("Kalikan 2"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMultiParamCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _paramXController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: "Parameter X"),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    controller: _paramYController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: "Parameter Y"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      final x = double.tryParse(_paramXController.text) ?? 0;
                      final y = double.tryParse(_paramYController.text) ?? 0;
                      final res = _service.kalikan(x, y);
                      _log("Contoh 4: kalikan($x, $y)\nHasil = $res");
                    },
                    child: const Text("kalikan(x, y)"),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF10B981),
                    ),
                    onPressed: () {
                      final x = double.tryParse(_paramXController.text) ?? 0;
                      final y = double.tryParse(_paramYController.text) ?? 0;
                      final res = _service.anonymousKali(x, y);
                      _log("Anonymous Function: functionPerkalian($x, $y)\nHasil = $res");
                    },
                    child: const Text("Anonymous (x * y)"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDefaultParamCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _n1Controller,
                    decoration: const InputDecoration(labelText: "Nilai n1"),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    controller: _s1Controller,
                    enabled: !_useDefaultS1,
                    decoration: InputDecoration(
                      labelText: "s1 (Default: 45)",
                      fillColor: _useDefaultS1 ? Colors.grey.shade900 : null,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Checkbox(
                  value: _useDefaultS1,
                  activeColor: const Color(0xFF6C63FF),
                  onChanged: (val) {
                    setState(() {
                      _useDefaultS1 = val ?? true;
                    });
                  },
                ),
                const Text("Gunakan nilai default s1: 45"),
              ],
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final n1 = _n1Controller.text;
                  if (_useDefaultS1) {
                    final res = _service.tampilkanangka(n1);
                    _log("tampilkanangka($n1)\nHasil n1 = ${res['n1']}\nHasil s1 = ${res['s1']} (Nilai Default)");
                  } else {
                    final s1 = int.tryParse(_s1Controller.text) ?? 45;
                    final res = _service.tampilkanangka(n1, s1: s1);
                    _log("tampilkanangka($n1, s1: $s1)\nHasil n1 = ${res['n1']}\nHasil s1 = ${res['s1']} (Custom Value)");
                  }
                },
                child: const Text("Uji tampilkanangka()"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
