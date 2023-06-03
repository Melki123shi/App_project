import 'package:flutter_test/flutter_test.dart';
import 'package:oneone/application/state/login_state.dart';

void main() {
  group('LoginState', () {
    test('supports value comparison', () {
      expect(LoginState.initial(), LoginState.initial());
      expect(LoginState.isLoading(), LoginState.isLoading());
      expect(LoginState.isSuccess(), LoginState.isSuccess());
      expect(LoginState.isFailure(errorMessage: 'test_error'), LoginState.isFailure(errorMessage: 'test_error'));
    });

    test('copyWith creates a new object with the specified fields', () {
      final originalState = LoginState.initial();
      final newState = originalState.copyWith(isLoading: true);

      expect(originalState.isLoading, false);
      expect(newState.isLoading, true);
    });
  });
}