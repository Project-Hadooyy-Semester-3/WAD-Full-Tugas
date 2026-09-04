import 'package:flutter_test/flutter_test.dart';

import '../soal1/soal1.dart';
import '../Tugas-7-oop/Tugas-Enkapsulasi/lingkaran.dart' as enkapsulasi;
import '../Tugas-7-oop/Tugas-Inheritance/armor_titan.dart';
import '../Tugas-7-oop/Tugas-Inheritance/attack_titan.dart';
import '../Tugas-7-oop/Tugas-Inheritance/beast_titan.dart';
import '../Tugas-7-oop/Tugas-Inheritance/human.dart';
import '../Tugas-7-oop/Tugas-Inheritance/titan.dart';
import '../Tugas-7-oop/Tugas-Polymorism/bangun_datar.dart';
import '../Tugas-7-oop/Tugas-Polymorism/lingkaran.dart' as poly_lingkaran;
import '../Tugas-7-oop/Tugas-Polymorism/persegi.dart';
import '../Tugas-7-oop/Tugas-Polymorism/segitiga.dart' as poly_segitiga;
import '../Tugas-7-oop/Tugas-Constructor/employee.dart';

void main() {
  group('Acara 10: OOP Unit Tests', () {
    test('1. Prosedural ke Class: Segitiga calculation', () {
      final segitiga = Segitiga(alas: 20.0, tinggi: 30.0);
      expect(segitiga.luas, equals(300.0));
      expect(segitiga.hitungLuas(), equals(300.0));
    });

    test('2. Enkapsulasi: Lingkaran negative input converted to positive', () {
      final ling = enkapsulasi.Lingkaran();
      ling.jariJari = -7.0;
      expect(ling.jariJari, equals(7.0));
      expect(ling.luas, closeTo(153.86, 0.001));

      ling.setJariJari(-10.0);
      expect(ling.getJariJari(), equals(10.0));
      expect(ling.luas, closeTo(314.0, 0.001));
    });

    test('3. Inheritance: Titan powerPoint minimum 5 and specific skills', () {
      final baseTitan = Titan();
      baseTitan.powerPoint = 2; // Should become 5
      expect(baseTitan.powerPoint, equals(5.0));

      final armor = ArmorTitan()..powerPoint = 8;
      expect(armor.powerPoint, equals(8.0));
      expect(armor.terjang(), equals("dush.. dush.."));

      final attack = AttackTitan()..powerPoint = 12;
      expect(attack.powerPoint, equals(12.0));
      expect(attack.punch(), equals("blam.. blam.."));

      final beast = BeastTitan()..powerPoint = 3; // Should become 5
      expect(beast.powerPoint, equals(5.0));
      expect(beast.lempar(), equals("wush wush.."));

      final human = Human()..powerPoint = 7;
      expect(human.powerPoint, equals(7.0));
      expect(human.killAlltitan(), equals(" Sasageyo ... Shinzo Sasageyo..."));
    });

    test('4. Polymorphism: Bangun Datar sub classes override luas & keliling', () {
      final BangunDatar persegi = Persegi(4.0);
      expect(persegi.luas(), equals(16.0));
      expect(persegi.keliling(), equals(16.0));

      final BangunDatar segitiga = poly_segitiga.Segitiga(3.0, 4.0);
      expect(segitiga.luas(), equals(6.0));
      expect(segitiga.keliling(), equals(12.0)); // 3 + 4 + 5

      final BangunDatar ling = poly_lingkaran.Lingkaran(7.0);
      expect(ling.luas(), closeTo(153.86, 0.001));
      expect(ling.keliling(), closeTo(43.96, 0.001));
    });

    test('5. Constructor: Employee instance created properly', () {
      final emp = Employee(
        id: "EMP-001",
        name: "Hadi",
        department: "Mobile Development",
      );
      expect(emp.id, equals("EMP-001"));
      expect(emp.name, equals("Hadi"));
      expect(emp.department, equals("Mobile Development"));
    });
  });
}
