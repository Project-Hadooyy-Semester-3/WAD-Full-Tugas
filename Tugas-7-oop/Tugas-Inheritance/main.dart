// Acara 10: Inheritance
// File: Tugas-7-oop/Tugas-Inheritance/main.dart

import 'armor_titan.dart';
import 'attack_titan.dart';
import 'beast_titan.dart';
import 'human.dart';
import 'titan.dart';

void main(List<String> args) {
  Titan titan = Titan();
  ArmorTitan armorTitan = ArmorTitan();
  AttackTitan attackTitan = AttackTitan();
  BeastTitan beastTitan = BeastTitan();
  Human human = Human();

  // Mengisi power point 5 class (jika di bawah 5 maka otomatis jadi 5)
  titan.powerPoint = 3; // Di bawah 5 -> otomatis 5
  armorTitan.powerPoint = 8;
  attackTitan.powerPoint = 10;
  beastTitan.powerPoint = 4; // Di bawah 5 -> otomatis 5
  human.powerPoint = 7;

  print("=== Power Point 5 Class ===");
  print("Titan Base Power Point : ${titan.powerPoint}");
  print("Armor Titan Power Point: ${armorTitan.powerPoint}");
  print("Attack Titan Power Point: ${attackTitan.powerPoint}");
  print("Beast Titan Power Point: ${beastTitan.powerPoint}");
  print("Human Power Point      : ${human.powerPoint}");

  print("\n=== Action/Skill Child Class 1-4 ===");
  print("Armor Titan Action : ${armorTitan.terjang()}");
  print("Attack Titan Action: ${attackTitan.punch()}");
  print("Beast Titan Action : ${beastTitan.lempar()}");
  print("Human Action       : ${human.killAlltitan()}");
}
