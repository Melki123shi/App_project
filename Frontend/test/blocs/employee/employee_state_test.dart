import 'package:flutter_test/flutter_test.dart';
import 'package:example_app/models/employees_model.dart';
import 'package:example_app/states/employees_state.dart';

void main() {
  group('EmployeesLoadingState', () {
    test('toString returns correct value', () {
      expect(EmployeesLoadingState().toString(), equals('EmployeesLoadingState'));
    });
  });

  group('EmployeesLoadedState', () {
    test('toString returns correct value', () {
      final employees = [Employee(id: 1, name: 'John'), Employee(id: 2, name: 'Jane')];
      expect(EmployeesLoadedState(employees).toString(), equals('EmployeesLoadedState{employees: $employees}'));
    });
  });

  group('EmployeesErrorState', () {
    test('toString returns correct value', () {
      final message = 'An error occurred';
      expect(EmployeesErrorState(message).toString(), equals('EmployeesErrorState{message: $message}'));
    });
  });
}
