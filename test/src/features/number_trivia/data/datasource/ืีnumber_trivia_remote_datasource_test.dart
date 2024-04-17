
import 'package:clean_architecture_tdd/core/error/execeptions.dart';
import 'package:clean_architecture_tdd/features/number_trivia/data/datasource/number_trivia_remote_datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

class FakeUri extends Fake implements Uri {}

class MockClient extends Mock implements http.Client{}


void main(){


  late http.Client client;
  late NumberTriviaRemoteDataSource numberTriviaRemoteDataSource;


  setUp(() {
    client = MockClient();
    numberTriviaRemoteDataSource = NumberTriviaRemoteDataSourceImplement(client);
    registerFallbackValue(FakeUri());

  });



  group("getConcreteNumberTrivia", () {
    const tNumber = 1;
    test("should perfom GET request on URL with number and return numbertrivia", () async{
      //Arrange
      when(()=> client.get(any(), headers: any(named: "headers"),)).thenAnswer((_) async => http.Response('{"text": "success", "number": $tNumber}',200));
      // Act
      final result = await numberTriviaRemoteDataSource.getConcreteNumberTrivia(tNumber);
      // Assert
      expect(result.number, tNumber);
    });

    test("should throw a SeverException when response code is 404 or other", () async{
      when(()async=> client.get(any(),headers: any(named: "headers"))).thenThrow(const APIException(message: "Not Found", statusCode: 404));

      final result = await   numberTriviaRemoteDataSource.getConcreteNumberTrivia(tNumber); 
      expect(result, const Left(APIException(message: "Not Found",statusCode: 404)));
    });
  });
}