import 'package:clean_architecture_tdd/core/common/entities/user.dart';
import 'package:clean_architecture_tdd/core/utils/typedef.dart';
import 'package:clean_architecture_tdd/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:equatable/equatable.dart';

import 'package:clean_architecture_tdd/core/usecases/usecase.dart';

class UserSignUp implements Usecase<User,ParamsSignUp>{
  final AuthenticationRepository authenticationRepository;

  UserSignUp( this.authenticationRepository);
  @override
  ResultFuture<User> call(ParamsSignUp paramsSignUp) async {
    final user = await   authenticationRepository.signUpWithEmailPassword(name: paramsSignUp.name, email: paramsSignUp.email, password: paramsSignUp.password);
    return user;
  }
  
}

class ParamsSignUp extends Equatable {
  final String name;
  final String email;
  final String password;

  const ParamsSignUp({required this.name, required this.email, required this.password});

  @override
  List<Object> get props => [name, email, password];
}
