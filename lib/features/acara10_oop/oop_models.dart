import 'dart:math';

// 1. Model Segitiga (Mengubah Prosedural ke Class)
class SegitigaOOP {
  double setengah;
  double alas;
  double tinggi;

  SegitigaOOP({
    this.setengah = 0.5,
    required this.alas,
    required this.tinggi,
  });

  double hitungLuas() => setengah * alas * tinggi;
  double get luas => hitungLuas();
}

// 2. Model Lingkaran Enkapsulasi
class LingkaranEnkapsulasi {
  double _jariJari = 0.0;
  static const double pi = 3.14;

  void setJariJari(double value) {
    if (value < 0) {
      _jariJari = value * -1;
    } else {
      _jariJari = value;
    }
  }

  double getJariJari() => _jariJari;

  set jariJari(double value) {
    if (value < 0) {
      _jariJari = value * -1;
    } else {
      _jariJari = value;
    }
  }

  double get jariJari => _jariJari;
  double get luas => pi * _jariJari * _jariJari;
}

// 3. Model Titan Inheritance
class TitanModel {
  final String name;
  final String description;
  double _powerPoint = 5.0;

  TitanModel({required this.name, required this.description});

  double get powerPoint => _powerPoint;

  set powerPoint(double value) {
    if (value < 5) {
      _powerPoint = 5.0;
    } else {
      _powerPoint = value;
    }
  }

  String performSkill() => "Titan mengaum!";
}

class ArmorTitanModel extends TitanModel {
  ArmorTitanModel()
      : super(name: "Armor Titan", description: "Titan dengan perisai baja baja kuat");

  String terjang() => "dush.. dush..";

  @override
  String performSkill() => terjang();
}

class AttackTitanModel extends TitanModel {
  AttackTitanModel()
      : super(name: "Attack Titan", description: "Titan petarung penyerang");

  String punch() => "blam.. blam..";

  @override
  String performSkill() => punch();
}

class BeastTitanModel extends TitanModel {
  BeastTitanModel()
      : super(name: "Beast Titan", description: "Titan pelempar proyektil jarak jauh");

  String lempar() => "wush wush..";

  @override
  String performSkill() => lempar();
}

class HumanModel extends TitanModel {
  HumanModel()
      : super(name: "Human", description: "Pasukan pengintai pembasmi titan");

  String killAlltitan() => " Sasageyo ... Shinzo Sasageyo...";

  @override
  String performSkill() => killAlltitan();
}

// 4. Model Polimorfisme Bangun Datar
abstract class ShapeBangunDatar {
  String get nama;
  double hitungLuas();
  double hitungKeliling();
  String get rumusLuas;
  String get rumusKeliling;
}

class PersegiShape extends ShapeBangunDatar {
  double sisi;
  PersegiShape(this.sisi);

  @override
  String get nama => "Persegi";

  @override
  double hitungLuas() => sisi * sisi;

  @override
  double hitungKeliling() => 4 * sisi;

  @override
  String get rumusLuas => "sisi * sisi ($sisi * $sisi)";

  @override
  String get rumusKeliling => "4 * sisi (4 * $sisi)";
}

class SegitigaSikuShape extends ShapeBangunDatar {
  double alas;
  double tinggi;
  late double sisiMiring;

  SegitigaSikuShape(this.alas, this.tinggi, [double? c]) {
    sisiMiring = c ?? sqrt((alas * alas) + (tinggi * tinggi));
  }

  @override
  String get nama => "Segitiga Siku-Siku";

  @override
  double hitungLuas() => 0.5 * alas * tinggi;

  @override
  double hitungKeliling() => alas + tinggi + sisiMiring;

  @override
  String get rumusLuas => "0.5 * alas * tinggi (0.5 * $alas * $tinggi)";

  @override
  String get rumusKeliling =>
      "alas + tinggi + sisi_miring ($alas + $tinggi + ${sisiMiring.toStringAsFixed(2)})";
}

class LingkaranShape extends ShapeBangunDatar {
  double jariJari;
  static const double pi = 3.14;

  LingkaranShape(this.jariJari);

  @override
  String get nama => "Lingkaran";

  @override
  double hitungLuas() => pi * jariJari * jariJari;

  @override
  double hitungKeliling() => 2 * pi * jariJari;

  @override
  String get rumusLuas => "3.14 * r * r (3.14 * $jariJari * $jariJari)";

  @override
  String get rumusKeliling => "2 * 3.14 * r (2 * 3.14 * $jariJari)";
}

// 5. Model Employee Constructor
class EmployeeModel {
  String id;
  String name;
  String department;

  EmployeeModel({
    required this.id,
    required this.name,
    required this.department,
  });
}
