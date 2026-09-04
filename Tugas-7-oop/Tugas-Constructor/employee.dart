// Acara 10: Constructor
// File: Tugas-7-oop/Tugas-Constructor/employee.dart

class Employee {
  String id;
  String name;
  String department;

  Employee({
    required this.id,
    required this.name,
    required this.department,
  });

  @override
  String toString() {
    return "Employee[ID: $id, Name: $name, Department: $department]";
  }
}
