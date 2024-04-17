import 'package:clean_architecture_tdd/core/utils/typedef.dart';
import 'package:clean_architecture_tdd/features/number_trivia/domain/entities/number_trivia.dart';

abstract class NumberTriviaRepository {

 ResultFuture<NumberTrivia> getConcreteNumberTrivia(int number);
 ResultFuture<NumberTrivia> getRandomNumberTrivia();
}


