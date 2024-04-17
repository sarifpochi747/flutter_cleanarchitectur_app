import 'dart:convert';
import 'package:clean_architecture_tdd/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:clean_architecture_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import "package:http/http.dart" as http;


abstract class NumberTriviaRemoteDataSource {
  // call the http://numbersapi.com/{number} endpoint


  /// Throws a [ServerExeception] for all error codes
  Future<NumberTrivia> getConcreteNumberTrivia(int number);


  // call the http://numbersapi.com/random endpoint
  /// Throws a [ServerExeception] for all error codes
  Future<NumberTrivia> getRandomNumberTrivia();

}


class NumberTriviaRemoteDataSourceImplement implements NumberTriviaRemoteDataSource{

  final http.Client _client;
  final String url = "http://numbersapi.com";

  NumberTriviaRemoteDataSourceImplement(this._client);


  @override
  Future<NumberTrivia> getConcreteNumberTrivia(int number) async {
    final response =  await _client.get(Uri.parse("$url/$number"));
    if (response.statusCode == 200) {
    // Parse the response body as JSON
    final jsonResponse = json.decode(response.body);

    // Extract text and number from the JSON object
    final text = jsonResponse['text'];
    final number = jsonResponse['number'];

    // Return a new NumberTrivia object
    return NumberTrivia(text: text, number: number);
  } else {
    throw Exception('Failed to load number trivia');
  }
  }

  @override
  Future<NumberTrivia> getRandomNumberTrivia() async {
    final response = await _client.get(Uri.parse("$url/random"));
    if(response.statusCode == 200){
      final jsonResponse = json.decode(response.body);
      final result = NumberTriviaModel.fromJson(jsonResponse);
      return Future.value(result);
    }else{
      throw Exception('Failed to load number trivia');
    }
  }

}