import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:my_app/blocs/cars_bloc.dart';
import 'package:my_app/events/cars_event.dart';
import 'package:my_app/models/available_cars_model.dart';
import 'package:my_app/repository/car_repository.dart';
import 'package:my_app/states/cars_state.dart';
import 'package:mocktail/mocktail.dart';
import 'package:oneone/domain/car/car_repository.dart';
import 'package:oneone/domain/car/carmodel.dart';

class MockCarRepository extends Mock implements CarRepository {}

void main() {
  group('CarsBloc', () {
    late CarRepository carRepository;
    late CarsBloc carsBloc;

    setUp(() {
      carRepository = MockCarRepository();
      carsBloc = CarsBloc(carRepository: carRepository);
    });

    tearDown(() {
      carsBloc.close();
    });

    final car1 = Car(make: 'Toyota', model: 'Corolla');
    final car2 = Car(make: 'Honda', model: 'Civic');
    final cars = [car1, car2];
    final error = 'Failed to load cars';

    blocTest<CarsBloc, CarsState>(
      'emits [CarsLoadingState, CarsLoadedState] when LoadCarsEvent is added',
      build: () {
        when(() => carRepository.getCars()).thenAnswer((_) async => cars);
        return carsBloc;
      },
      act: (bloc) => bloc.add(LoadCarsEvent()),
      expect: () => <CarsState>[
        CarsLoadingState(),
        CarsLoadedState(cars),
      ],
    );

    blocTest<CarsBloc, CarsState>(
      'emits [CarsLoadingState, CarsErrorState] when LoadCarsEvent fails',
      build: () {
        when(() => carRepository.getCars()).thenThrow(error);
        return carsBloc;
      },
      act: (bloc) => bloc.add(LoadCarsEvent()),
      expect: () => <CarsState>[
        CarsLoadingState(),
        CarsErrorState(error),
      ],
    );

    blocTest<CarsBloc, CarsState>(
      'emits [CarsLoadedState] when AddCarEvent is added',
      build: () {
        when(() => carRepository.addCar(car1)).thenAnswer((_) async {});
        when(() => carRepository.getCars()).thenAnswer((_) async => cars + [car1]);
        return carsBloc;
      },
      act: (bloc) => bloc
        ..add(LoadCarsEvent())
        ..add(AddCarEvent(car1)),
      expect: () => <CarsState>[
        CarsLoadingState(),
        CarsLoadedState(cars),
        CarsLoadedState(cars + [car1]),
      ],
    );
  
  }
}