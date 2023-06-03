import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/user.dart';
import '../event/login_event.dart';
import '../state/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      // Simulate an API call to check the user's credentials.
      await Future.delayed(Duration(seconds: 1));

      if (event.username == 'admin' && event.password == 'admin') {
        yield LoginSuccess(
          user: UserModel(
            username: event.username,
            password: event.password,
            role: UserRole.admin,
          ),
        );
      } else if (event.username == 'user' && event.password == 'user') {
        yield LoginSuccess(
          user: UserModel(
            username: event.username,
            password: event.password,
            role: UserRole.user,
          ),
        );
      } else {
        yield LoginFailure(error: 'Invalid username or password');
      }
    } else if (event is LogoutButtonPressed) {
      yield LogoutSuccess();
    }
  }
}