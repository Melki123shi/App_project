import 'package:flutter_bloc/flutter_bloc.dart';
import '../event/BottomNav_Event.dart';
import 'dart:async';

class BottomNavigationBloc extends Bloc<BottomNavigationEvent, int> {
  BottomNavigationBloc() : super(0);

  @override
  Stream<int> mapEventToState(BottomNavigationEvent event) async* {
    switch (event) {
      case BottomNavigationEvent.home:
        yield 0;
        break;
      case BottomNavigationEvent.mysolds:
        yield 1;
        break;
      case BottomNavigationEvent.creditrequest:
        yield 2;
        break;
        case BottomNavigationEvent.setting:
        yield 3;
        break;

    }
  }
}
