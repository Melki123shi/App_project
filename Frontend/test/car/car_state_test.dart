import 'package:flutter_test/flutter_test.dart';
import 'package:example_app/models/available_cars_model.dart';
import 'package:example_app/states/cars_state.dart';

void main() {
  group('CarsLoadingState', () {
    test('toString returns correct value', () {
      expect(CarsLoadingState().toString(), equals('CarsLoadingState'));
    });
  });

  group('CarsLoadedState', () {
    test('toString returns correct value', () {
      final cars = [Car(id: 1, name: 'Toyota'), Car(id: 2, name: 'Honda')];
      expect(CarsLoadedState(cars).toString(), equals('CarsLoadedState{cars: $cars}'));
    });
  });

  group('CarsSoldState', () {
    test('toString returns correct value', () {
      final availableCars = [Car(id: 1, name: 'Toyota')];
      final soldCars = [Car(id: 2, name: 'Honda')];
      expect(CarsSoldState(availableCars, soldCars).toString(), equals('CarsSoldState{availableCars: $availableCars, soldCars: $soldCars}'));
    });
  });

  group('CarsErrorState', () {
    test('toString returns correct value', () {
      final errorMessage = 'An error occurred';
      expect(CarsErrorState(errorMessage).toString(), equals('CarsErrorState{errorMessage: $errorMessage}'));
    });
  });
}
