

// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:clean_architecture_tdd/core/utils/typedef.dart';
import 'package:clean_architecture_tdd/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:clean_architecture_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main(){
  final tNumberTriviaModel = NumberTriviaModel(text: "text", number: 1);
  final tJson = fixture("trivia.json");
  final tMap = jsonDecode(tJson) as DataMap;



  test("should be subclass of NumberTrivia Entity", () async {
    expect(tNumberTriviaModel, isA<NumberTrivia>());
  });

  group("from map", () { 
    test("should return right data", () async {

      //act
      final result = NumberTriviaModel.fromMap(tMap);
      //assert
      expect(result, tNumberTriviaModel);
    });
  });
  group("from json", () { 
    test("should return right data", () async {

      //act
      final result = NumberTriviaModel.fromJson(tJson);
      //assert
      expect(result, tNumberTriviaModel);
    });
  });

  group("to map", () { 
    test("should return right data", () async {

      //act
      final result = tNumberTriviaModel.toMap();
      //assert
      expect(result, tMap);
    });
  });

  group("to json", () { 
    test("should return right data", () async {

      //act
      final result = tNumberTriviaModel.toJson();
      final tJson = jsonEncode({
    "number": 1,
    "text" : "text",
    
});

      //assert
      expect(result, tJson);
    });
  });


  

}