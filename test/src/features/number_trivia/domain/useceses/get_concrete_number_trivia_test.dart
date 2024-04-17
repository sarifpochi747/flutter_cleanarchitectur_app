// ignore_for_file: prefer_const_constructors

import 'package:clean_architecture_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_architecture_tdd/features/number_trivia/domain/usecase/get_concrete_number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'number_trivia_repository.mock.dart';



void main(){
  late MockNumberTriviaRepository mockNumberTriviaRepository;
  late GetConcreteNumberTrivia usecase;
  const tNumberTrivia = NumberTrivia(text: "Test", number: 1);
  const tNumber = 1;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  });



  test(
    "Should get trivia for the number from the repository",
    () async* {
      // arrage
      when(()async => mockNumberTriviaRepository.getConcreteNumberTrivia(any())).thenAnswer((invocation) async=>Right(tNumberTrivia));


      // act
      final result = await usecase.call(Params(number: tNumber));


      //assert
      expect(result, Right(tNumberTrivia));
      verify(()=>mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber)).called(1);
      verifyNoMoreInteractions(mockNumberTriviaRepository);
  });

}