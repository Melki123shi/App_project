import 'package:flutter_test/flutter_test.dart';
import 'package:example_app/events/employees_event.dart';
import 'package:example_app/models/employees_model.dart';

void main() {
  group('LoadEmployeesEvent', () {
    test('toString returns correct value', () {
      expect(LoadEmployeesEvent().toString(), equals('LoadEmployeesEvent'));
    });
  });

  group('AddEmployeeEvent', () {
    test('toString returns correct value', () {
      final employee = Employee(id: 1, name: 'John');
      expect(AddEmployeeEvent(employee).toString(), equals('AddEmployeeEvent{employee: $employee}'));
    });
  });

  group('RemoveEmployeeEvent', () {
    test('toString returns correct value', () {
      final employee = Employee(id: 1, name: 'John');
      expect(RemoveEmployeeEvent(employee).toString(), equals('RemoveEmployeeEvent{employee: $employee}'));
    });
  });

  group('EditEmployeeEvent', () {
    test('toString returns correct value', () {
      final employee = Employee(id: 1, name: 'John');
      expect(EditEmployeeEvent(employee).toString(), equals('EditEmployeeEvent{employee: $employee}'));
    });
  });
}
