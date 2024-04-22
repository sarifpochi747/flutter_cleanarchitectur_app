import 'package:clean_architecture_tdd/core/common/entities/user.dart';
import 'package:clean_architecture_tdd/core/error/execeptions.dart';
import 'package:clean_architecture_tdd/core/error/failures.dart';
import 'package:clean_architecture_tdd/core/utils/typedef.dart';
import 'package:clean_architecture_tdd/features/authentication/data/datasource/authentication_remote_data_source.dart';
import 'package:clean_architecture_tdd/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:dartz/dartz.dart';




class AuthenticationRepositoryImplementation implements AuthenticationRepository{

  final AuthenticationRemoteDataSource authenticationRemoteDataSource;

  AuthenticationRepositoryImplementation(this.authenticationRemoteDataSource);


  @override
  ResultVoid createUser({required String name, required String email, required String password}) async{
    // test driven development
    // call the remote data source
    // make sure that it return the proper data if there is no exception
    // check if the method return the properties data source
    // check if when the remoteDataSource throws  exception
    try {
      await authenticationRemoteDataSource.createUser(password: password, name: name, email: email);
      return Future.value(const Right(null));
    }on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }    
  }

  @override
  ResultFuture<List<User>> getUsers() async {
    try {
      final result = await authenticationRemoteDataSource.getUsers();
      return right(result);
    } on APIException catch (e) {
      return left(APIFailure.fromException(e));
    }
  }
  
  @override
  ResultFuture<User> signInWithEmailPassword({required String email, required String password}) async {
    try {
      final userId = await  authenticationRemoteDataSource.signInWithEmailPassword(email: email, password: password);
      return right(userId);
    } on APIException catch (e) {

      return  Left(APIFailure.fromException(e));
    }
  }
  
  @override
  ResultFuture<User> signUpWithEmailPassword({required String name, required String email, required String password}) async {
    try {
      final user = await  authenticationRemoteDataSource.signUpWithEmailPassword(email: email, password: password,name: name);
      return right(user);
    } on APIException catch (e) {
      return left(APIFailure.fromException(e));
    }
  }
  
  // @override
  // ResultFuture<User> currentUser() {

  // }

}