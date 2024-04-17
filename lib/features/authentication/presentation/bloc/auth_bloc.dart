import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_architecture_tdd/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:clean_architecture_tdd/core/common/entities/user.dart';
import 'package:clean_architecture_tdd/core/error/failures.dart';
import 'package:clean_architecture_tdd/features/authentication/domain/usecases/user_signin.dart';
import 'package:clean_architecture_tdd/features/authentication/domain/usecases/user_signup.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserSignIn _userSignIn;
  final AppUserCubit _appUserCubit;
  AuthBloc(this._userSignUp, this._userSignIn, this._appUserCubit) : super(AuthInitial()) {
    on<AuthSignUp>(_authSignUp);
    on<AuthSignIn>(_authSignIn);
  }

  Future<FutureOr<void>> _authSignUp(AuthSignUp event, Emitter<AuthState> emit) async {
      emit(AuthLoading());
      final res = await  _userSignUp.call(ParamsSignUp(name: event.name, email: event.email, password: event.password));
      res.fold(
        (failure) => _emitAuthFailure(failure, emit),
        (user) => _emitAuthSuccess(user, emit)
      );
  }

  Future<FutureOr<void>> _authSignIn(AuthSignIn event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final response = await _userSignIn.call(ParamsSignIn(email: event.email, password: event.password));
    response.fold(
      (failure) => _emitAuthFailure(failure, emit), 
      (user) => _emitAuthSuccess(user, emit)
    );
  }

  void _emitAuthFailure(Failure failure,Emitter emit){
    emit(AuthFailure(failure.message, failure.statusCode));
  } 

  void _emitAuthSuccess( User user,Emitter emit){
    emit(AuthSuccess(user: user));
    _appUserCubit.updateUser(user);
  } 
}