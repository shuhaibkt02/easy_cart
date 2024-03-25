import 'package:easy_cart/feature/auth/domain/use%20cases/login_case.dart';
import 'package:easy_cart/feature/auth/domain/use%20cases/sign_up_case.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final LoginCase _loginCase;
  AuthBloc({required UserSignUp userSignUp, required LoginCase loginCase})
      : _userSignUp = userSignUp,
        _loginCase = loginCase,
        super(AuthInitial()) {
    on<AuthSignUp>(
      (event, emit) async {
        emit(AuthLoading());

        final res = await _userSignUp.useCaseCall(
          SignUpParams(
            email: event.email,
            password: event.password,
            name: event.name,
          ),
        );

        res.fold(
          (failure) => emit(AuthError(errorMessage: failure.errorMessage)),
          (uuid) => emit(AuthSuccess(uuid: uuid)),
        );
      },
    );

    on<AuthLogin>((event, emit) async {
      emit(AuthLoading());

      final res = await _loginCase.useCaseCall(
          LoginParams(email: event.email, password: event.password));

      res.fold(
        (failure) => emit(AuthError(errorMessage: failure.errorMessage)),
        (uuid) => emit(AuthSuccess(uuid: uuid)),
      );
    });
  }
}
