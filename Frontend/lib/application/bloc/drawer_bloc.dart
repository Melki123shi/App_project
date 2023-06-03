import 'package:flutter_bloc/flutter_bloc.dart';
import '../event/drawer_event.dart';
import '../state/drawer_state.dart';

class DrawerBloc extends Bloc<DrawerEvent, DrawerState> {
  DrawerBloc() : super(DrawerClosedState());

  @override
  Stream<DrawerState> mapEventToState(
    DrawerEvent event,
  ) async* {
    if (event is ToggleDrawerEvent) {
      if (state is DrawerClosedState) {
        yield DrawerOpenState();
      } else {
        yield DrawerClosedState();
      }
    }
  }
}