import 'package:clean_architecture_tdd/core/utils/typedef.dart';
import 'package:clean_architecture_tdd/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:clean_architecture_tdd/features/number_trivia/domain/entities/number_trivia.dart';

abstract class NumberTriviaLocalDataSource{

  /// Gets the cached [NumberTriviaModel] which was gotten the last time
  /// the users had as internet connection.
  /// 
  /// Throws [CacheExeception] if no cached data is present 
  ResultFuture<NumberTrivia> getLastNumberTrivia();


  ResultVoid cacheNumberTrivia(NumberTriviaModel triviaModel);
}