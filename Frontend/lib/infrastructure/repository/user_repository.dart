import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../domain/car/carmodel.dart';
import '../../domain/credit/creditmodels.dart';
import '../../domain/employee/employeemodels.dart';
import '../../domain/user/usermodel.dart';
import '../database/dataProvider/user_data_provider.dart';

class UserRepository {
  final UserDataProvider dataProvider = UserDataProvider();
  static const storage =  FlutterSecureStorage();

    Future<void> deleteToken() async {
      return await storage.deleteAll();
     }
    
    Future<bool> hasToken() async {
       String? token = await storage.read(key:"token");
      return token != null;
     }

  Future<List<User>> getUsers() async {
    final usersJson = await dataProvider.getUsers();
    return usersJson.map((creditJson) => User.fromJson(creditJson as Map<String, dynamic>)).toList();
  }

  Future<User> getUserById(String id) async {
    final userJson = await dataProvider.getUserById(id as int);
    return User.fromJson(userJson as Map<String, dynamic>);
  }

  Future<List<Employee>> getEmployees() async {
    final employeesJson = await dataProvider.getEmployees();
    return employeesJson.map((employeeJson) => Employee.fromJson(employeeJson as Map<String, dynamic>)).toList();
  }

  Future<Employee> getEmployeeById(String id) async {
    final employeeJson = await dataProvider.getEmployeeById(id);
    return Employee.fromJson(employeeJson as Map<String, dynamic>);
  }

  Future<Employee> createEmployee(Employee employee) async {
    final employeeJson = await dataProvider.createEmployee(employee.toJson() as Employee);
    return Employee.fromJson(employeeJson as Map<String, dynamic>);
  }

  Future<void> updateEmployee(Employee employee) async {
    await dataProvider.updateEmployee(employee.id, employee.toJson() as Employee);
  }

  Future<void> deleteEmployee(String id) async {
    await dataProvider.deleteEmployee(id);
  }
  Future<List<Credit>> getPendingCredits() async {
    final creditsJson = await dataProvider.getApprovedCredits();
    return creditsJson.map((creditJson) => Credit.fromJson(creditJson as Map<String, dynamic>)).toList();
  }

  Future<Credit> getApprovedCredits() async {
    final creditJson = await dataProvider.getApprovedCredits();
    return Credit.fromJson(creditJson as Map<String, dynamic>);
  }

  Future<void> approveCredit(String id) async {
    await dataProvider.approveCredit(id);
  }
  Future<List<Credit>> getAllCredits() async {
    final creditsJson = await dataProvider.getAllCredits();
    return creditsJson.map((creditJson) => Credit.fromJson(creditJson as Map<String, dynamic>)).toList();
  }
 
  Future<Credit> createCredit(Credit credit) async {
    final creditJson = await dataProvider.createCredit(credit as Map<String, dynamic>);
    return Credit.fromJson(creditJson as Map<String, dynamic>);
  }

  Future<List<Car>> getCars() async {
    final carsJson = await dataProvider.getCars();
    return carsJson.map((carJson) => Car.fromJson(carJson as Map<String, dynamic>)).toList();
  }


  Future<Car>  getAvailableCars() async {
    final carJson = await dataProvider.getAvailableCars();
    return Car.fromJson(carJson as Map<String, dynamic>);

  }
   Future<Car>  getSoldCars() async {
    final carJson = await dataProvider.getCars();
    return Car.fromJson(carJson as Map<String, dynamic>);

  }

  Future<void> addCar(Car car) async {
    await dataProvider.addCar(car.toJson() as Car);
  }

  Future<void> updateCar(Car car) async {
    await dataProvider.updateCar(car.id, car.toJson() as Car);
  }

  Future<void> deleteCar(String id) async {
    await dataProvider.deleteCar(id);
  }
}

