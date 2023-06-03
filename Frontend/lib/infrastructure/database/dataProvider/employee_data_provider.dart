import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../domain/car/carmodel.dart';
import '../../../domain/credit/creditmodels.dart';
import '../../../domain/user/usermodel.dart';

class EmployeeProvider {
  final String baseUrl = 'http://localhost:3000/api/motors/';
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

   Future<dynamic> getuser(dynamic username, dynamic password) async {
    var response = await http.post(
      Uri.parse('$baseUrl /users/login'),
      headers: {"Content.type": "application/json"},
      body: {'username': username, 'password': password},
    );
    if (response.statusCode == 200) {
      const storage = FlutterSecureStorage();
      await storage.write(
          key: "token", value: "${jsonDecode(response.body)["user"]['token']}");
      dynamic json = jsonDecode(response.body);
      dynamic user = User.fromJson(json['user']);
      return user;
    } else {
      return response.statusCode;
    }
  }


  Future<String> _getToken() async {
    final String? token = await _storage.read(key: 'auth_token');
    if (token == null) {
      throw Exception('Authentication token not found');
    }
    return token;
  }

  Future<void> getUser(password, username) async {
    final response = await http.get(Uri.parse('$baseUrl/me'), headers: {
      'x-auth-token': await _getToken(),
    });

    if (response.statusCode == 200) {
      final  userJson = json.decode(response.body);
      return userJson;
    } else {
      throw Exception('');
    }
  }

    Future<User> createUser(User user) async {
    final response = await http.post(
      Uri.parse('$baseUrl/users/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );
    if (response.statusCode == 201) {
      final dynamic userJson = json.decode(response.body);
      return User.fromJson(userJson);
    } else {
      throw Exception('Failed to create user');
    }
  }

  Future<void> updateUser(User user) async {
    final response = await http.put(
      Uri.parse('$baseUrl/users/${user.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );
    if (response.statusCode != 204) {
      throw Exception('Failed to update user with id: ${user.id}');
    }
  }

  Future<void> deleteUser(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/users/$id'));
    if (response.statusCode != 204) {
      throw Exception('Failed to delete user with id: $id');
    }
  }
  
    Future<Credit> getCreditById(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/credit/$id'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> creditJson = json.decode(response.body);
      return Credit.fromJson(creditJson);
    } else {
      throw Exception('Failed to load credit');
    }
  }

  Future<Credit> updateCredit(String id, Map<String, dynamic> data) async {
    final response = await http.put(Uri.parse('$baseUrl/credit/$id'), body: data);
    if (response.statusCode == 200) {
      final Map<String, dynamic> creditJson = json.decode(response.body);
      return Credit.fromJson(creditJson);
    } else {
      throw Exception('Failed to update credit');
    }
  }

  Future<Credit> deleteCredit(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/credit/$id'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> creditJson = json.decode(response.body);
      return Credit.fromJson(creditJson);
    } else {
      throw Exception('Failed to delete credit');
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

  Future<Car> getCarById(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/cars/availableCars/$id'));
    final jsonData = json.decode(response.body);
    return Car.fromJson(jsonData);
  }
  
  Future<Car> sellCar(String id, {int negotiationPrice=0}) async {
    final response = await http.patch(
      Uri.parse('$baseUrl/cars/availableCars/$id/sold'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'negotiationPrice': negotiationPrice}),
    );
    final jsonData = json.decode(response.body);
    return Car.fromJson(jsonData);
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

}