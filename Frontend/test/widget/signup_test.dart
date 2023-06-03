import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:oneone/Presentation/signup.dart';

void main() {
  testWidgets('Signup Screen Test', (WidgetTester tester) async {
    // Build the Signup widget
    final signup = Signup();
    await tester.pumpWidget(MaterialApp(home: signup));

    // Verify that the Signup screen contains the expected widgets
    expect(find.widgetWithText(TextFormField, 'Confirmation Code'), findsOneWidget);
    expect(find.widget(ElevatedButton), findsOneWidget);

    // Enter test data into the confirmation code text field
    final confirmationCodeTextField = find.widgetWithText(TextFormField, 'Confirmation Code');
    await tester.enterText(confirmationCodeTextField, 'test confirmation code');

    // Tap the confirm button and verify that it does not show an error message
    await tester.tap(find.widgetWithText(ElevatedButton, 'Confirm'));
    await tester.pumpAndSettle();
    expect(find.text('Don\'t use blank spaces'), findsNothing);
  });
}