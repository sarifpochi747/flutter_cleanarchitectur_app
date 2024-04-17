import 'dart:convert';

import 'package:clean_architecture_tdd/core/utils/typedef.dart';
import 'package:clean_architecture_tdd/features/number_trivia/domain/entities/number_trivia.dart';

class NumberTriviaModel extends NumberTrivia{
  const NumberTriviaModel({required super.text, required super.number}); 


  NumberTriviaModel.fromMap(DataMap map)
  :this(
    number: map["number"] as int,
    text: map["text"] as String,
  );
  

  factory NumberTriviaModel.fromJson(String source) => NumberTriviaModel.fromMap(json.decode(source) as DataMap);

  String toJson()=> json.encode(toMap());
  
  DataMap toMap() {
    return{
      "number" : number,
      "text" : text
    };
  }


  NumberTriviaModel copyWith({int? number,String? text}){
    return NumberTriviaModel(text: text?? this.text, number: number?? this.number);
  }

}