import 'package:flutter/material.dart';
import 'oop_models.dart';

class OopScreen extends StatefulWidget {
  const OopScreen({super.key});

  @override
  State<OopScreen> createState() => _OopScreenState();
}

class _OopScreenState extends State<OopScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // State Segitiga
  final TextEditingController _alasController =
      TextEditingController(text: "20.0");
  final TextEditingController _tinggiController =
      TextEditingController(text: "30.0");
  double _luasSegitiga = 300.0;

  // State Enkapsulasi Lingkaran
  final TextEditingController _radiusController =
      TextEditingController(text: "-7.0");
  final LingkaranEnkapsulasi _lingkaranEnkap = LingkaranEnkapsulasi();
  String _enkapStatus = "";

  // State Titan Inheritance
  final List<TitanModel> _titans = [
    TitanModel(name: "Titan Base", description: "Induk kelas Titan"),
    ArmorTitanModel(),
    AttackTitanModel(),
    BeastTitanModel(),
    HumanModel(),
  ];
  String _lastActionTitan = "Pilih titan dan picu aksi serangannya!";

  // State Polimorfisme
  final double _persegiSisi = 4.0;
  final double _segitigaAlas = 3.0;
  final double _segitigaTinggi = 4.0;
  final double _lingkaranJariJari = 7.0;

  // State Constructor Employee
  final TextEditingController _empIdController =
      TextEditingController(text: "EMP-001");
  final TextEditingController _empNameController =
      TextEditingController(text: "Hadi");
  final TextEditingController _empDeptController =
      TextEditingController(text: "Mobile Development");
  final List<EmployeeModel> _employees = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    // Initial setup
    _lingkaranEnkap.jariJari = -7.0;
    _enkapStatus =
        "Input: -7.0 -> Divalidasi: ${_lingkaranEnkap.jariJari} -> Luas: ${_lingkaranEnkap.luas}";

    // Set initial titan power points
    _titans[0].powerPoint = 3; // Minimum 5
    _titans[1].powerPoint = 8;
    _titans[2].powerPoint = 10;
    _titans[3].powerPoint = 4; // Minimum 5
    _titans[4].powerPoint = 7;

    // Initial employees
    _employees.add(EmployeeModel(
      id: "EMP-001",
      name: "Hadi",
      department: "Mobile Development",
    ));
    _employees.add(EmployeeModel(
      id: "EMP-002",
      name: "Hilmy",
      department: "Backend Engineering",
    ));
  }

  @override
  void dispose() {
    _tabController.dispose();
    _alasController.dispose();
    _tinggiController.dispose();
    _radiusController.dispose();
    _empIdController.dispose();
    _empNameController.dispose();
    _empDeptController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Acara 10: Pemrograman OOP"),
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          indicatorColor: const Color(0xFF6C63FF),
          tabs: const [
            Tab(icon: Icon(Icons.change_circle), text: "Class Segitiga"),
            Tab(icon: Icon(Icons.shield), text: "Enkapsulasi"),
            Tab(icon: Icon(Icons.fitness_center), text: "Inheritance Titan"),
            Tab(icon: Icon(Icons.category), text: "Polimorfisme"),
            Tab(icon: Icon(Icons.badge), text: "Constructor"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildSegitigaTab(theme),
          _buildEnkapsulasiTab(theme),
          _buildInheritanceTab(theme),
          _buildPolymorphismTab(theme),
          _buildConstructorTab(theme),
        ],
      ),
    );
  }

  // 1. Tab Prosedural ke Class
  Widget _buildSegitigaTab(ThemeData theme) {
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
                    const Icon(Icons.change_circle, color: Color(0xFF6C63FF)),
                    const SizedBox(width: 8),
                    Text(
                      "Mengubah Prosedural ke Class Segitiga",
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Text(
                  "Mengubah variabel primitif luas segitiga (0.5 * alas * tinggi) ke objek class Segitiga berorientasi objek.",
                  style: TextStyle(color: Colors.grey),
                ),
                const Divider(height: 24, color: Color(0xFF333852)),
                TextField(
                  controller: _alasController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Alas Segitiga",
                    prefixIcon: Icon(Icons.straighten),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _tinggiController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Tinggi Segitiga",
                    prefixIcon: Icon(Icons.height),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      final alas = double.tryParse(_alasController.text) ?? 0;
                      final tinggi = double.tryParse(_tinggiController.text) ?? 0;
                      final segitiga = SegitigaOOP(alas: alas, tinggi: tinggi);
                      setState(() {
                        _luasSegitiga = segitiga.luas;
                      });
                    },
                    icon: const Icon(Icons.calculate),
                    label: const Text("Hitung Luas via Class Segitiga"),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF23273B),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFF6C63FF)),
                  ),
                  child: Column(
                    children: [
                      const Text("Hasil Luas Segitiga (getter luas):"),
                      const SizedBox(height: 4),
                      Text(
                        _luasSegitiga.toStringAsFixed(2),
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF8C85FF),
                        ),
                      ),
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

  // 2. Tab Enkapsulasi
  Widget _buildEnkapsulasiTab(ThemeData theme) {
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
                    const Icon(Icons.shield, color: Color(0xFF10B981)),
                    const SizedBox(width: 8),
                    Text(
                      "Enkapsulasi Lingkaran (Validasi Nilai Minus)",
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Text(
                  "Rule: Atribut _jariJari disembunyikan (private). Jika input bernilai negatif (-), setter otomatis mengalikan -1 sehingga nilai tetap positif.",
                  style: TextStyle(color: Colors.grey),
                ),
                const Divider(height: 24, color: Color(0xFF333852)),
                TextField(
                  controller: _radiusController,
                  keyboardType: const TextInputType.numberWithOptions(
                    signed: true,
                    decimal: true,
                  ),
                  decoration: const InputDecoration(
                    labelText: "Input Jari-jari (Coba masukkan angka minus)",
                    prefixIcon: Icon(Icons.radar),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF10B981),
                    ),
                    onPressed: () {
                      final input = double.tryParse(_radiusController.text) ?? 0;
                      _lingkaranEnkap.jariJari = input;
                      setState(() {
                        _enkapStatus =
                            "Input Asli: $input\nSetelah Validasi: ${_lingkaranEnkap.jariJari}\nLuas Lingkaran: ${_lingkaranEnkap.luas}";
                      });
                    },
                    icon: const Icon(Icons.check_circle),
                    label: const Text("Set Jari-jari & Validasi"),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF23273B),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SelectableText(
                    _enkapStatus,
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 14,
                      color: Color(0xFFE2E8F0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // 3. Tab Inheritance
  Widget _buildInheritanceTab(ThemeData theme) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          color: const Color(0xFF23273B),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Status Aksi Titan:",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF8C85FF),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _lastActionTitan,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          "Daftar Karakter (Inheritance dari Class Titan):",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ..._titans.map((titan) {
          final isBase = titan.runtimeType == TitanModel;
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        titan.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF6C63FF).withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "Power: ${titan.powerPoint.toInt()}",
                          style: const TextStyle(
                            color: Color(0xFF8C85FF),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    titan.description,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: Slider(
                          value: titan.powerPoint,
                          min: 1,
                          max: 20,
                          divisions: 19,
                          label: "${titan.powerPoint.toInt()}",
                          onChanged: (val) {
                            setState(() {
                              titan.powerPoint = val;
                            });
                          },
                        ),
                      ),
                      if (!isBase)
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _lastActionTitan =
                                  "${titan.name}: \"${titan.performSkill()}\"";
                            });
                          },
                          child: const Text("Skill"),
                        ),
                    ],
                  ),
                  Text(
                    "Rule: Jika input < 5, otomatis di-set ke 5.",
                    style: TextStyle(
                      fontSize: 11,
                      color: titan.powerPoint == 5 ? Colors.amber : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }

  // 4. Tab Polimorfisme
  Widget _buildPolymorphismTab(ThemeData theme) {
    final shapes = <ShapeBangunDatar>[
      PersegiShape(_persegiSisi),
      SegitigaSikuShape(_segitigaAlas, _segitigaTinggi),
      LingkaranShape(_lingkaranJariJari),
    ];

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
                    const Icon(Icons.category, color: Color(0xFF6C63FF)),
                    const SizedBox(width: 8),
                    Text(
                      "Polimorfisme Bangun Datar",
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  "Setiap turunan BangunDatar meng-override method hitungLuas() dan hitungKeliling() dengan rumus khususnya masing-masing.",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        ...shapes.map((shape) {
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    shape.nama,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF8C85FF),
                    ),
                  ),
                  const Divider(color: Color(0xFF333852)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Luas:", style: TextStyle(color: Colors.grey)),
                          Text(
                            shape.hitungLuas().toStringAsFixed(2),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            shape.rumusLuas,
                            style: const TextStyle(
                              fontSize: 11,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text("Keliling:",
                              style: TextStyle(color: Colors.grey)),
                          Text(
                            shape.hitungKeliling().toStringAsFixed(2),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            shape.rumusKeliling,
                            style: const TextStyle(
                              fontSize: 11,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }

  // 5. Tab Constructor Employee
  Widget _buildConstructorTab(ThemeData theme) {
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
                    const Icon(Icons.badge, color: Color(0xFFF59E0B)),
                    const SizedBox(width: 8),
                    Text(
                      "Constructor Employee",
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _empIdController,
                  decoration: const InputDecoration(labelText: "Employee ID"),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _empNameController,
                  decoration: const InputDecoration(labelText: "Employee Name"),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _empDeptController,
                  decoration:
                      const InputDecoration(labelText: "Department"),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF59E0B),
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () {
                      final id = _empIdController.text.trim();
                      final name = _empNameController.text.trim();
                      final dept = _empDeptController.text.trim();
                      if (id.isNotEmpty && name.isNotEmpty) {
                        setState(() {
                          _employees.add(EmployeeModel(
                            id: id,
                            name: name,
                            department: dept,
                          ));
                        });
                      }
                    },
                    icon: const Icon(Icons.add),
                    label: const Text("Buat Objek via Constructor"),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          "Daftar Employee Yang Diinstansiasi:",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        const SizedBox(height: 8),
        ..._employees.map((emp) {
          return Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Color(0xFFF59E0B),
                child: Icon(Icons.person, color: Colors.black),
              ),
              title: Text(
                emp.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("${emp.id} • ${emp.department}"),
            ),
          );
        }),
      ],
    );
  }
}
