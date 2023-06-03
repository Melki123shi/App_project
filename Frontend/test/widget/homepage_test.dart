import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:oneone/Presentation/home.dart';


void main() {
  testWidgets('Home Screen Test', (WidgetTester tester) async {
    // Build the Home widget
    final home = HomePage();
    await tester.pumpWidget(MaterialApp(home: home));

    // Verify that the Home screen contains the expected widgets
    expect(find.byType(GestureDetector), findsOneWidget);
    expect(find.byType(Icon), findsNWidgets(3));
    expect(find.byType(Text), findsNWidgets(2));
    expect(find.byType(ElevatedButton), findsOneWidget);

    // Tap the get started button and verify that it navigates to the login screen
    await tester.tap(find.widgetWithText(ElevatedButton, 'Get Started'));
    await tester.pumpAndSettle();
    expect(find.byKey(Key('/login')), findsOneWidget);
  });
}