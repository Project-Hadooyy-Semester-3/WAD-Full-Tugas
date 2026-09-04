import 'package:flutter/material.dart';
import 'core/app_theme.dart';
import 'features/acara9_function/function_screen.dart';
import 'features/acara10_oop/oop_screen.dart';
import 'features/acara11_12_async/async_screen.dart';

void main() {
  runApp(const TugasWadApp());
}

class TugasWadApp extends StatelessWidget {
  const TugasWadApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BKPM Dart & OOP - Tugas WAD',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const MainNavigationScreen(),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    FunctionScreen(),
    OopScreen(),
    AsyncScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.code),
            selectedIcon: Icon(Icons.code, color: Color(0xFF6C63FF)),
            label: "Acara 9: Function",
          ),
          NavigationDestination(
            icon: Icon(Icons.account_tree),
            selectedIcon: Icon(Icons.account_tree, color: Color(0xFF6C63FF)),
            label: "Acara 10: OOP",
          ),
          NavigationDestination(
            icon: Icon(Icons.sync_alt),
            selectedIcon: Icon(Icons.sync_alt, color: Color(0xFF6C63FF)),
            label: "Acara 11-12: Async",
          ),
        ],
      ),
    );
  }
}
