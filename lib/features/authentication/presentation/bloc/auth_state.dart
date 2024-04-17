part of 'auth_bloc.dart';

class AuthState extends Equatable {
  const AuthState();
  
  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}


final class AuthLoading extends AuthState{}
final class AuthSuccess extends AuthState{
  final User user;

  const   AuthSuccess({required this.user});

}
final class AuthFailure extends AuthState{
  final String message;
  final int statusCode;

  const AuthFailure(this.message, this.statusCode);

}