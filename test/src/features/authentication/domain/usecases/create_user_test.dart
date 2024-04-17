
import 'package:clean_architecture_tdd/features/authentication/domain/usecases/create_user.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'authentication_repository.mock.dart';


void main(){

  late CreateUser usecase;
  late MockAuthRepo mockAuthRepo;


  setUp(() {

    mockAuthRepo  = MockAuthRepo();
    usecase = CreateUser(mockAuthRepo);


  });



  test("should call authRepo.createUser", () async{

    when(()=> mockAuthRepo.createUser(
      name: any(named: "name"), 
      email: any(named: "email"), 
      password: any(named: "password")
      ),).thenAnswer((invocation) async => const Right(null));
    // Act
    final result = await usecase.call(Params(name: "sarif", email: "sarifpochi@email.com", password: "4/4/2024"));

    // Assert
    expect(result, equals(const Right<dynamic,void>(null)));
    verify(()=> mockAuthRepo.createUser(name: "sarif", email: "sarifpochi@email.com", password: "4/4/2024")).called(1);
    verifyNoMoreInteractions(mockAuthRepo);
  });
}