import "package:flutter_driver/flutter_driver.dart";
import 'package:test/test.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  group('Login and Signup Feature Tests', () {
    FlutterDriver? driver;
    // WebViewController currentUrl;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        await driver?.close();
      }
    });

    test('Signup Test', () async {
      // Navigate to the signup page
      await driver?.tap(find.byValueKey('signup-button'));

      // Enter valid user information
      await driver?.tap(find.byValueKey('name-field'));
      await driver?.enterText('John Doe');

      await driver?.tap(find.byValueKey('email-field'));
      await driver?.enterText('johndoe@example.com');

      await driver?.tap(find.byValueKey('password-field'));
      await driver?.enterText('password');

      await driver?.tap(find.byValueKey('varification-code-field'));
      await driver?.enterText('verification code');

      // Submit the form
      await driver?.tap(find.byValueKey('signup-form-submit-button'));

      // Verify that the user is redirected to the login page
      expect(await driver?.currentUrl, contains('/login'));

      // Verify that the user is able to see a success message indicating that their account has been created
      expect(await driver?.getText(find.byValueKey('success-message')), equals('Your account has been created successfully'));

      // Verify that the user's information has been saved to the database
      // You can write additional code to check the database here
    });

    test('Login Test', () async {
      // Navigate to the login page
      await driver?.tap(find.byValueKey('login-button'));

      // Enter valid login credentials
      await driver?.tap(find.byValueKey('email-field'));
      await driver?.enterText('johndoe@example.com');

      await driver?.tap(find.byValueKey('password-field'));
      await driver?.enterText('password');

      await driver?.tap(find.byValueKey('varification-code'));
      await driver?.enterText('varification code');

      // Submit the form
      await driver?.tap(find.byValueKey('login-form-submit-button'));

      // Verify that the user is redirected to the dashboard page
      expect(await driver?.currentUrl, contains('/dashboard'));

      // Verify that the user is able to see their account information on the dashboard
      expect(await driver?.getText(find.byValueKey('welcome-message')), equals('Welcome, John Doe!'));

      // Verify that the user is able to access all the features that require authentication
      // You can write additional code to test the features here
    });

    test('Error Handling Test', () async {
      // Test invalid login credentials
      await driver?.tap(find.byValueKey('login-button'));
      await driver?.tap(find.byValueKey('email-field'));
      await driver?.enterText('johndoe@example.com');
      await driver?.tap(find.byValueKey('password-field'));
      await driver?.enterText('wrongpassword');
      await driver?.tap(find.byValueKey('login-form-submit-button'));
      expect(await driver?.getText(find.byValueKey('error-message')), equals('Invalid email or password'));

      // Test invalid signup information
      await driver?.tap(find.byValueKey('signup-button'));
      await driver?.tap(find.byValueKey('name-field'));
      await driver?.enterText('John Doe');
      await driver?.tap(find.byValueKey('email-field'));
      await driver?.enterText('invalidemail');
      await driver?.tap(find.byValueKey('password-field'));
      await driver?.enterText('password');
      await driver?.tap(find.byValueKey('varification-code-field'));
      await driver?.enterText('varififcation code');
      await driver?.tap(find.byValueKey('signup-form-submit-button'));
      expect(await driver?.getText(find.byValueKey('error-message')), equals('Invalid email address'));
    });
  });
}