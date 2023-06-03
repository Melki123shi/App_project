import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeesBloc extends Bloc<EmployeesEvent, EmployeesState> {
  final EmployeeRepository _employeeRepository;

  EmployeesBloc({required EmployeeRepository employeeRepository})
      : _employeeRepository = employeeRepository,
        super(EmployeesLoadingState());

  List<Employee> get employees => (_employeeRepository.employees.isEmpty)
      ? []
      : List.unmodifiable(_employeeRepository.employees);

  Stream<EmployeesState> mapEventToState(EmployeesEvent event) async* {
    if (event is LoadEmployeesEvent) {
      yield EmployeesLoadingState();
      try {
        final employees = await _employeeRepository.getEmployees();
        yield EmployeesLoadedState(employees);
      } catch (e) {
        yield EmployeesErrorState('Failed to load employees');
      }
    } else if (event is AddEmployeeEvent) {
      try {
        await _employeeRepository.addEmployee(event.employee);
        final employees = await _employeeRepository.getEmployees();
        yield EmployeesLoadedState(employees);
      } catch (e) {
        yield EmployeesErrorState('Failed to add employee');
      }
    } else if (event is RemoveEmployeeEvent) {
      try {
        await _employeeRepository.removeEmployee(event.employee);
        final employees = await _employeeRepository.getEmployees();
        yield EmployeesLoadedState(employees);
      } catch (e) {
        yield EmployeesErrorState('Failed to remove employee');
      }
    } else if (event is EditEmployeeEvent) {
      try {
        await _employeeRepository.editEmployee(event.employee);
        final employees = await _employeeRepository.getEmployees();
        yield EmployeesLoadedState(employees);
      } catch (e) {
        yield EmployeesErrorState('Failed to edit employee');
      }
    }
  }

  // Fetch employees data from database
  void fetchEmployeesData() {
    add(LoadEmployeesEvent());
  }
}
