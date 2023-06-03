import 'employeemodels.dart';

abstract class EmployeeRepository {
  Future<List<Employee>> getEmployees();
  Future<Employee> getEmployeeById(String id);
  Future<Employee> createEmployee(Employee employee);
  Future<Employee> updateEmployee(String id, Employee employee);
  Future<void> deleteEmployee(String id);
}
