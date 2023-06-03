import 'package:flutter_test/flutter_test.dart';
import '../models/available_cars_model.dart';
import '../../../lib/domain/car/carmodel.dart';

void main() {
  group('CarsEvent', () {
    final Car testCar = Car(id: '1', make: 'Toyota', model: 'Camry', year: 2020);
    final double testPrice = 25000;

    test('LoadCarsEvent', () {
      final event = LoadCarsEvent();
      expect(event, isA<LoadCarsEvent>());
    });

    test('AddCarEvent', () {
      final event = AddCarEvent(car: testCar);
      expect(event.car, testCar);
    });

    test('RemoveCarEvent', () {
      final event = RemoveCarEvent(car: testCar);
      expect(event.car, testCar);
    });

    test('EditCarEvent', () {
      final event = EditCarEvent(car: testCar);
      expect(event.car, testCar);
    });

    test('SellCarEvent', () {
      final event = SellCarEvent(car: testCar, price: testPrice);
      expect(event.car, testCar);
      expect(event.price, testPrice);
    });
  });
}