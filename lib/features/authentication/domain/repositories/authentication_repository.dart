import 'package:clean_architecture_tdd/core/common/entities/user.dart';
import 'package:clean_architecture_tdd/core/utils/typedef.dart';

abstract class AuthenticationRepository{
  const AuthenticationRepository();



  ResultVoid createUser({
    required String name,
    required String email,
    required String password
  });
  ResultFuture<List<User>> getUsers();
  ResultFuture<User> signUpWithEmailPassword({
    required String name,required String email,required String password
  });
  ResultFuture<User> signInWithEmailPassword({
    required String email,required String password
  });
  // ResultFuture<User> currentUser();
}