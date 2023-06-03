import '../../domain/car/carmodel.dart';
import '../../domain/credit/creditmodels.dart';
import '../../domain/user/usermodel.dart';
import '../../infrastructure/database/dataProvider/employee_data_provider.dart';


class EmployeeRepository {
  final EmployeeProvider dataProvider = EmployeeProvider();

  Future<Credit> createCredit(Credit credit) async {
    final creditJson = await dataProvider.createCredit(credit as Map<String, dynamic>);
    return Credit.fromJson(creditJson as Map<String, dynamic>);
  }

  Future<List<Car>> getCars() async {
    final carsJson = await dataProvider.getCars();
    return carsJson.map((carJson) => Car.fromJson(carJson as Map<String, dynamic>)).toList();
  }
  

  Future<Car> getCarById(String id) async {
    final carJson = await dataProvider.getCarById(id);
    return Car.fromJson(carJson as Map<String, dynamic>);

  }
  Future<Car>  getAvailableCars() async {
    final carJson = await dataProvider.getAvailableCars();
    return Car.fromJson(carJson as Map<String, dynamic>);

  }
   Future<Car>  getSoldCars() async {
    final carJson = await dataProvider.getCars();
    return Car.fromJson(carJson as Map<String, dynamic>);

  }
   Future<Car>  sellCar(String id) async {
    final carJson = await dataProvider.sellCar(id);
    return Car.fromJson(carJson as Map<String, dynamic>);
  }
  
  Future<dynamic>? getUser(dynamic password, dynamic username) async {
    return dataProvider.getUser(password,username);
    }
 Future<Credit> getCreditById(String id) async {
    final creditJson = await dataProvider.getCreditById(id);
    return Credit.fromJson(creditJson as Map<String, dynamic>);
  }
  Future<User> createUser(User user) async {
    final userJson = await dataProvider.createUser(user);
    return User.fromJson(userJson as Map<String, String>);
  }
    Future<Credit> updateCredit(String id, Map<String, dynamic> data) async {
    final creditJson = await dataProvider.updateCredit(id,data);
    return Credit.fromJson(creditJson as Map<String, dynamic>);
  }


  Future<void> deleteCredit(String id) async {
    await dataProvider.deleteCredit(id);
  }

  Future<User> updateUser(User user) async {
    final userJson = await dataProvider.updateUser(user);
    return User.fromJson(userJson as Map<String, dynamic>);
  }

  Future<void> deleteUser(String id) async {
    await dataProvider.deleteUser(id as int);
  }
}
