import 'package:clean_architecture_tdd/core/usecases/usecase.dart';
import 'package:clean_architecture_tdd/core/utils/typedef.dart';
import 'package:clean_architecture_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_architecture_tdd/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:equatable/equatable.dart';

class GetConcreteNumberTrivia implements Usecase<NumberTrivia,Params>{
  final NumberTriviaRepository numberTriviaRepository ;
  
  GetConcreteNumberTrivia(this.numberTriviaRepository);

  @override
  ResultFuture<NumberTrivia> call(Params params) async {
        return await numberTriviaRepository.getConcreteNumberTrivia(params.number);

  }
  
  


}


class Params extends Equatable{
  final int number;

  const Params({required this.number});
  
  @override
  List<Object?> get props => [number];

  
}