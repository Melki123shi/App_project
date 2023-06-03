import 'package:flutter_test/flutter_test.dart';
import 'package:oneone/application/bloc/login_bloc.dart';
import 'package:oneone/application/event/login_event.dart';
import 'package:oneone/application/model/user.dart';
import 'package:oneone/application/state/login_state.dart';


void main() {
  group('LoginBloc', () {
    late LoginBloc loginBloc;
    late UserModel userModel;

    setUp(() {
      userModel = UserModel(username: 'test_user', password: 'test_password');
      loginBloc = LoginBloc(userModel: userModel);
    });

    tearDown(() {
      loginBloc.close();
    });

    test('initial state is correct', () {
      expect(loginBloc.state, LoginState.initial());
    });

    blocTest<LoginBloc, LoginState>(
      'emits [Loading, Success] when LoginButtonPressed event is added and credentials are correct',
      build: () => loginBloc,
      act: (bloc) => bloc.add(LoginButtonPressed(username: userModel.username, password: userModel.password)),
      expect: () => <LoginState>[
        LoginState.loading(),
        LoginState.success(),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'emits [Loading, Failure] when LoginButtonPressed event is added and credentials are incorrect',
      build: () => loginBloc,
      act: (bloc) => bloc.add(LoginButtonPressed(username: 'invalid_username', password: 'invalid_password')),
      expect: () => <LoginState>[
        LoginState.loading(),
        LoginState.failure(errorMessage: 'Invalid username or password'),
      ],
    );
  });
}