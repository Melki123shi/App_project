import 'carmodel.dart';

abstract class CarRepository {
  Future<List<Car>> getCars();
  Future<Car> getCarById(String id);
  Future<Car> getAvailableCars();
  Future<Car> getSoldCars();
  Future<Car> sellCar(String id);
  Future<void> addCar(Car car);
  Future<void> updateCar(Car car);
  Future<void> deleteCar(String id);
}
