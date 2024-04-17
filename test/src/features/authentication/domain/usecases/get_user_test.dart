

import 'package:clean_architecture_tdd/features/authentication/domain/entities/user.dart';
import 'package:clean_architecture_tdd/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:clean_architecture_tdd/features/authentication/domain/usecases/get_users.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'authentication_repository.mock.dart';


void main(){
  late AuthenticationRepository authenticationRepository;
  late GetUsers usecase;


  setUp(() {
    authenticationRepository  = MockAuthRepo();
    usecase = GetUsers(authenticationRepository: authenticationRepository);
  });

  const tUser = User(id: "1", name: "sarif", password: "4/4/2024", email: "sarifpochi@email.com");
  const tUsers = [tUser];
  test("should call AuthRepo.getUsers", () async*{
    when(() async =>
      authenticationRepository.getUsers()).thenAnswer((_) async => const Right(tUsers));


    // act
    final result  = await usecase();

    //assert
    expect(result, equals(const Right<dynamic,List<User>>(tUsers)));
    verify(()=> authenticationRepository.getUsers()).called(1);
    verifyNoMoreInteractions(authenticationRepository);



  });

}