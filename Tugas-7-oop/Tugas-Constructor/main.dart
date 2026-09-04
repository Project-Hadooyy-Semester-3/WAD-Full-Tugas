// Acara 10: Constructor
// File: Tugas-7-oop/Tugas-Constructor/main.dart

import 'employee.dart';

void main(List<String> args) {
  Employee emp1 = Employee(
    id: "EMP-001",
    name: "Hadi",
    department: "Mobile Development",
  );

  Employee emp2 = Employee(
    id: "EMP-002",
    name: "Hilmy",
    department: "Backend Engineering",
  );

  print("=== Data Employee ===");
  print("ID          : ${emp1.id}");
  print("Nama        : ${emp1.name}");
  print("Departemen  : ${emp1.department}");

  print("\nID          : ${emp2.id}");
  print("Nama        : ${emp2.name}");
  print("Departemen  : ${emp2.department}");
}
