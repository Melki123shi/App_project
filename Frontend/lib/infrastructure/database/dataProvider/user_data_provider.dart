import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import '../../../domain/car/carmodel.dart';
import '../../../domain/credit/creditmodels.dart';
import '../../../domain/employee/employeemodels.dart';
import '../../../domain/user/usermodel.dart';

class UserDataProvider {
    final String baseUrl = 'http://localhost:3000/api/motors';
    final storage = const FlutterSecureStorage();

  Future<String> _getToken() async {
    final String? token = await storage.read(key: 'auth_token');
    if (token == null) {
      throw Exception('Authentication token not found');
    }
    return token;
  }

 
  Future<List<User>> getUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/users'));
    if (response.statusCode == 200) {
      final List<dynamic> usersJson = json.decode(response.body);
      return usersJson.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<User> getUserById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/users/$id'));
    if (response.statusCode == 200) {
      final dynamic userJson = json.decode(response.body);
      return User.fromJson(userJson);
    } else {
      throw Exception('Failed to load user with id: $id');
    }
  }

  Future<Employee> getEmployeeById(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/employees/$id'), headers: {
      'x-auth-token': await _getToken(),
    });

    if (response.statusCode == 200) {
      final Map<String, dynamic> employeeJson = json.decode(response.body);
      return Employee.fromJson(employeeJson);
    } else {
      throw Exception('Failed to load employee');
    }
  }

  Future<Employee> createEmployee(Employee employee) async {
    final response = await http.post(Uri.parse('$baseUrl/employees/register'), headers: {
      'x-auth-token': await _getToken(),
      'Content-Type': 'application/json',
    }, body: json.encode(employee.toJson()));

    if (response.statusCode == 200) {
      final Map<String, dynamic> employeeJson = json.decode(response.body);
      return Employee.fromJson(employeeJson);
    } else {
      throw Exception('Failed to create employee');
    }
  }
  Future<List<Credit>> getEmployees() async {
    final response = await http.get(Uri.parse('$baseUrl/employees'));
    if (response.statusCode == 200) {
      final List<dynamic> employeeJson = json.decode(response.body);
      return employeeJson.map((json) => Credit.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load Employees');
    }
  }

  Future<Employee> updateEmployee(String id, Employee employee) async {
    final response = await http.put(Uri.parse('$baseUrl/employees/$id'), headers: {
      'x-auth-token': await _getToken(),
      'Content-Type': 'application/json',
    }, body: json.encode(employee.toJson()));

    if (response.statusCode == 200) {
      final Map<String, dynamic> employeeJson = json.decode(response.body);
      return Employee.fromJson(employeeJson);
    } else {
      throw Exception('Failed to update employee');
    }
  }

  Future<Employee> deleteEmployee(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/employees/$id'), headers: {
      'x-auth-token': await _getToken(),
    });

    if (response.statusCode == 200) {
      final Map<String, dynamic> employeeJson = json.decode(response.body);
      return Employee.fromJson(employeeJson);
    } else {
      throw Exception('Failed to delete employee');
    }
  }
  Future<List<Credit>> getPendingCredits() async {
    final response = await http.get(Uri.parse('$baseUrl/credit/pending'));
    if (response.statusCode == 200) {
      final List<dynamic> creditJson = json.decode(response.body);
      return creditJson.map((json) => Credit.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load pending credits');
    }
  }

  Future<List<Credit>> getApprovedCredits() async {
    final response = await http.get(Uri.parse('$baseUrl/credit/approved'));
    if (response.statusCode == 200) {
      final List<dynamic> creditJson = json.decode(response.body);
      return creditJson.map((json) => Credit.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load approved credits');
    }
  }

  Future<Credit> approveCredit(String id) async {
    final response = await http.put(Uri.parse('$baseUrl/credit/$id/approve'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> creditJson = json.decode(response.body);
      return Credit.fromJson(creditJson);
    } else {
      throw Exception('Failed to approve credit');
    }
  }
  Future<Credit> createCredit(Map<String, dynamic> data) async {
    final response = await http.post(Uri.parse('$baseUrl/credit/request'), body: data);
    if (response.statusCode == 200) {
      final Map<String, dynamic> creditJson = json.decode(response.body);
      return Credit.fromJson(creditJson);
    } else {
      throw Exception('Failed to create credit');
    }
  }

  Future<List<Credit>> getAllCredits() async {
    final response = await http.get(Uri.parse('$baseUrl/credit'));
    if (response.statusCode == 200) {
      final List<dynamic> creditJson = json.decode(response.body);
      return creditJson.map((json) => Credit.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load credits');
    }
  }


  Future<List<Car>> getCars() async {
    final response = await http.get(Uri.parse('$baseUrl/cars'));
    final jsonData = json.decode(response.body) as List<dynamic>;
    return jsonData.map((car) => Car.fromJson(car)).toList();
  }

  Future<List<Car>> getAvailableCars() async {
    final response = await http.get(Uri.parse('$baseUrl/cars/availableCars'));
    final jsonData = json.decode(response.body) as List<dynamic>;
    return jsonData.map((car) => Car.fromJson(car)).toList();
  }

  Future<List<Car>> getSoldCars() async {
    final response = await http.get(Uri.parse('$baseUrl/cars/soldCars'));
    final jsonData = json.decode(response.body) as List<dynamic>;
    return jsonData.map((car) => Car.fromJson(car)).toList();
  }

  
  Future<Car> addCar(Car car) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(car.toJson()),
    );
    final jsonData = json.decode(response.body);
    return Car.fromJson(jsonData);
  }

  Future<Car> updateCar(String id, Car car) async {
    final response = await http.patch(
      Uri.parse('$baseUrl/cars/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(car.toJson()),
    );
    final jsonData = json.decode(response.body);
    return Car.fromJson(jsonData);
  }

  Future<void> deleteCar(String id) async {
    await http.delete(Uri.parse('$baseUrl/$id'));
  }

 
}


