part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}



class AuthSignUp extends AuthEvent{
  final String name;
  final String email;
  final String password;

  AuthSignUp({required this.name, required this.email, required this.password}){
    print(name);
    print(email);
    print(password);
  }

}
class AuthSignIn extends AuthEvent{
  final String email;
  final String password;

  AuthSignIn({required this.email, required this.password}){
    print(email);
    print(password);
  }
}