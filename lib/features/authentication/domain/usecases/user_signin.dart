import 'package:clean_architecture_tdd/core/common/entities/user.dart';
import 'package:clean_architecture_tdd/core/usecases/usecase.dart';
import 'package:clean_architecture_tdd/core/utils/typedef.dart';
import 'package:clean_architecture_tdd/features/authentication/domain/repositories/authentication_repository.dart';

class UserSignIn implements Usecase<User,ParamsSignIn>{
  final AuthenticationRepository authenticationRepository;

  UserSignIn(this.authenticationRepository);

  
  @override
  ResultFuture<User> call(ParamsSignIn paramsSignIn) async {
    final user = await authenticationRepository.signInWithEmailPassword(email: paramsSignIn.email, password: paramsSignIn.password);
    return user;  
  }
  
}

class ParamsSignIn {
  final String email;
  final String password;

  ParamsSignIn({required this.email, required this.password});
}