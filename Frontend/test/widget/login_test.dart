import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:oneone/Presentation/login_page.dart';


void main() {
  testWidgets('Login Screen Test', (WidgetTester tester) async {
    // Build the Login widget
    final login = LoginPage();
    await tester.pumpWidget(MaterialApp(home: login));

    // Verify that the Login screen contains the expected widgets
    expect(find.widgetWithText(TextFormField, 'Username'), findsOneWidget);
    expect(find.widgetWithText(TextFormField, 'Password'), findsOneWidget);
    expect(find.widget(ElevatedButton), findsOneWidget);

    // Enter test data into the email and password text fields
    final usernameTextField = find.widgetWithText(TextFormField, 'Username');
    final passwordTextField = find.widgetWithText(TextFormField, 'Password');
    await tester.enterText(usernameTextField, 'test username');
    await tester.enterText(passwordTextField, 'test password');

    // Tap the login button and verify that it navigates to the employee screen
    await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
    await tester.pumpAndSettle();
    expect(find.byKey(Key('/employee')), findsOneWidget);
  });
}