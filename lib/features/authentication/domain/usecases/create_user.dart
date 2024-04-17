// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:clean_architecture_tdd/core/utils/typedef.dart';
import 'package:clean_architecture_tdd/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:equatable/equatable.dart';

import 'package:clean_architecture_tdd/core/usecases/usecase.dart';

class CreateUser extends Usecase<void,Params>{
  final AuthenticationRepository authenticationRepository;

  CreateUser(this.authenticationRepository);

  @override
  ResultFuture<void> call(Params params) async => 
    await authenticationRepository.createUser(name: params.name, email: params.email, password: params.password);

}


class Params extends Equatable {
  final String name;
  final String email;
  final String password;

  Params({required this.name, required this.email, required this.password});
  
  @override
  List<Object> get props => [name, email, password];
}
