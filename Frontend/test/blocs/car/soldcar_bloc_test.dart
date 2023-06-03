import 'package:flutter_test/flutter_test.dart';
import '../models/sold_out_cars_model.dart';
import '../bloc/sold_cars_bloc.dart';

void main() {
  group('SoldCarsBloc', () {
    final SoldCar testCar1 = SoldCar(id: '1', make: 'Toyota', model: 'Camry', year: 2020, price: 25000);
    final SoldCar testCar2 = SoldCar(id: '2', make: 'Honda', model: 'Civic', year: 2019, price: 23000);
    final SoldCarsBloc soldCarsBloc = SoldCarsBloc();

    test('Initial state should be empty', () {
      expect(soldCarsBloc.soldCars, []);
    });

    test('Adding a sold car', () {
      soldCarsBloc.addSoldCar(testCar1);
      expect(soldCarsBloc.soldCars, [testCar1]);
    });

    test('Removing a sold car', () {
      soldCarsBloc.removeSoldCar(testCar1);
      expect(soldCarsBloc.soldCars, []);
    });

    test('Editing a sold car', () {
      soldCarsBloc.addSoldCar(testCar1);
      SoldCar updatedCar = SoldCar(id: '1', make: 'Toyota', model: 'Camry', year: 2021, price: 26000);
      soldCarsBloc.editSoldCar(updatedCar);
      expect(soldCarsBloc.soldCars[0], updatedCar);
    });
  });
}