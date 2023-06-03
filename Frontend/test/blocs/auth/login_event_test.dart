import 'package:flutter_test/flutter_test.dart';
import 'package:oneone/application/event/login_event.dart';

void main() {
  group('LoginButtonPressed', () {
    test('supports value comparison', () {
      expect(LoginButtonPressed(username: 'test_username', password: 'test_password'),
          LoginButtonPressed(username: 'test_username', password: 'test_password'));
    });
  });
}