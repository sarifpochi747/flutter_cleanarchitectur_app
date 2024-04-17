// ignore_for_file: prefer_const_constructors

import 'package:clean_architecture_tdd/core/error/execeptions.dart';
import 'package:clean_architecture_tdd/core/error/failures.dart';
import 'package:clean_architecture_tdd/features/authentication/data/datasource/authentication_remote_data_source.dart';
import 'package:clean_architecture_tdd/features/authentication/data/repositories/authentication_repository_implementation.dart';
import 'package:clean_architecture_tdd/features/authentication/domain/entities/user.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRemoteDataSource extends Mock implements AuthenticationRemoteDataSource{}


void main(){
  late AuthenticationRemoteDataSource authenticationRemoteDataSource;
  late AuthenticationRepositoryImplementation authenticationRepositoryImplementation;



  setUp(() {
    authenticationRemoteDataSource = MockAuthRemoteDataSource();
    authenticationRepositoryImplementation = AuthenticationRepositoryImplementation(authenticationRemoteDataSource);
  });


  group("createUser", () {
    test("should call the [RemoteDataSource.createUser] and complete ", () async {
      // Arrange: Mocking behavior of createUser method

      when(()async=>authenticationRemoteDataSource.createUser(password: any(named: "password"), name: any(named: "name"), email: any(named: "email"))).thenAnswer((invocation) async=>const Right(null));

      //act
      final result =await authenticationRepositoryImplementation.createUser(email: "email",name: "name",password: "password");

      //assert
      expect(result, const Right(null));
      verify(()=>authenticationRemoteDataSource.createUser(password: "password", name: "name", email: "email")).called(1);
    });  


    test("should return [ServerFailure] when call to remote unsuccessful", () async{

      // Arrange : Mocking 
      when(()async=>authenticationRemoteDataSource.createUser(password: any(named: "password"), name: any(named: "name"), email: any(named: "email"))).thenThrow(const APIException(message: "error", statusCode: 500));
      //act
      final result =await authenticationRepositoryImplementation.createUser(email: "email",name: "name",password: "password");

      expect(result, const Left(APIFailure(message: "error",statusCode: 500)));
  });


  });


  group("getUser", () { 
    test("should call [remoteDataSource.getUser] and return [List<User>]", () async {
      //arrange
      when(()async=>authenticationRemoteDataSource.getUsers()).thenAnswer((_) async => [],);
      // act
      final result = await authenticationRepositoryImplementation.getUsers();
      //assert
      expect(result, isA<Right<dynamic,List<User>>>());
      verify(()=> authenticationRemoteDataSource.getUsers()).called(1);
      verifyNoMoreInteractions(authenticationRemoteDataSource);

    });
  });
}