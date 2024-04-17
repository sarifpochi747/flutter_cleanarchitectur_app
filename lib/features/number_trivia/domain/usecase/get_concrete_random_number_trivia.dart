import 'package:clean_architecture_tdd/core/usecases/usecase.dart';
import 'package:clean_architecture_tdd/core/utils/typedef.dart';
import 'package:clean_architecture_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_architecture_tdd/features/number_trivia/domain/repositories/number_trivia_repository.dart';

class GetConcreteRandomNumberTrivia implements UsecaseWitoutParam<NumberTrivia>{
  final NumberTriviaRepository numberTriviaRepository;

  GetConcreteRandomNumberTrivia({required this.numberTriviaRepository});

  @override
  ResultFuture<NumberTrivia> call() async {
    return await numberTriviaRepository.getRandomNumberTrivia();
  }

 
  

}
