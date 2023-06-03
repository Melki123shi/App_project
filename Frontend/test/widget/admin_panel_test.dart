import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:oneone/Presentation/adminpanel/admin_panel_page.dart';

void main() {
  testWidgets('Admin Panel Test', (WidgetTester tester) async {
    // Build the AdminPanel widget
    final adminPanel = AdminPanel(key: Key('admin-panel'));
    await tester.pumpWidget(MaterialApp(home: adminPanel));

    // Verify that the AdminPanel contains the expected widgets
    expect(find.text('Greetings Admin!!'), findsOneWidget);
    expect(find.text('Cars'), findsOneWidget);
    expect(find.text('Employees'), findsOneWidget);
    expect(find.text('Profit'), findsOneWidget);
    expect(find.text('Credit'), findsOneWidget);

    // Tap the Cars button and verify that it navigates to Page1
    await tester.tap(find.text('Cars'));
    await tester.pumpAndSettle();
    expect(find.text('Page 1'), findsOneWidget);

    // Tap the Profit button and verify that it navigates to Page1
    await tester.tap(find.text('Profit'));
    await tester.pumpAndSettle();
    expect(find.text('Page 1'), findsOneWidget);
  });
}