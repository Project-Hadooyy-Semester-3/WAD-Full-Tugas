import 'package:flutter_test/flutter_test.dart';

import 'package:tugas_wad/main.dart';

void main() {
  testWidgets('TugasWadApp navigation smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const TugasWadApp());

    // Verify that Acara 9 screen is shown initially
    expect(find.text('Acara 9: Dart Functions'), findsOneWidget);
    expect(find.text('Output Console Log'), findsOneWidget);

    // Tap on NavigationDestination Acara 10: OOP
    await tester.tap(find.text('Acara 10: OOP'));
    await tester.pumpAndSettle();

    // Verify that Acara 10 screen is displayed
    expect(find.text('Acara 10: Pemrograman OOP'), findsOneWidget);
    expect(find.text('Class Segitiga'), findsOneWidget);

    // Tap on NavigationDestination Acara 11-12: Async
    await tester.tap(find.text('Acara 11-12: Async'));
    await tester.pumpAndSettle();

    // Verify that Acara 11 & 12 screen is displayed
    expect(find.text('Acara 11 & 12: Async, Future, Await'), findsOneWidget);
    expect(find.text('One Piece Async'), findsOneWidget);
  });
}
