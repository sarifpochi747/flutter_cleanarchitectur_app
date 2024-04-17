import 'package:clean_architecture_tdd/core/platform/network_info.dart';
import 'package:clean_architecture_tdd/core/utils/typedef.dart';
import 'package:clean_architecture_tdd/features/number_trivia/data/datasource/number_trivia_local_datasource.dart';
import 'package:clean_architecture_tdd/features/number_trivia/data/datasource/number_trivia_remote_datasource.dart';
import 'package:clean_architecture_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_architecture_tdd/features/number_trivia/domain/repositories/number_trivia_repository.dart';

class NumberTriviaRepositoryImplementation implements NumberTriviaRepository{


  final NumberTriviaLocalDataSource numberTriviaLocalDataSource;
  final NumberTriviaRemoteDataSource numberTriviaRemoteDataSource;
  final NetworkInfo networkInfo;

  NumberTriviaRepositoryImplementation({required this.numberTriviaLocalDataSource, required this.numberTriviaRemoteDataSource, required this.networkInfo});

  @override
  ResultFuture<NumberTrivia> getConcreteNumberTrivia(int number) {
    throw UnimplementedError();
  }

  @override
  ResultFuture<NumberTrivia> getRandomNumberTrivia() {
    throw UnimplementedError();
  }
}