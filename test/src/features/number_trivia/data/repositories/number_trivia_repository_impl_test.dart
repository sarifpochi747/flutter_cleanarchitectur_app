import 'package:clean_architecture_tdd/core/platform/network_info.dart';
import 'package:clean_architecture_tdd/features/number_trivia/data/datasource/number_trivia_local_datasource.dart';
import 'package:clean_architecture_tdd/features/number_trivia/data/datasource/number_trivia_remote_datasource.dart';
import 'package:clean_architecture_tdd/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:clean_architecture_tdd/features/number_trivia/data/repositories/number_trivia_repository_implementation.dart';
import 'package:clean_architecture_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRemoteDataSource extends Mock implements NumberTriviaRemoteDataSource{} 
class MockLocalDataSource extends Mock implements NumberTriviaLocalDataSource{} 
class MockNetworkInfo extends Mock implements NetworkInfo{}


void main(){
  late NumberTriviaRepositoryImplementation numberTriviaRepositoryImplementation;
  late MockLocalDataSource mockLocalDataSource;
  late MockRemoteDataSource mockRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;
  setUp(() {
    mockLocalDataSource = MockLocalDataSource();
    mockRemoteDataSource = MockRemoteDataSource();
    mockNetworkInfo  = MockNetworkInfo();
    numberTriviaRepositoryImplementation = NumberTriviaRepositoryImplementation(numberTriviaLocalDataSource:mockLocalDataSource,numberTriviaRemoteDataSource: mockRemoteDataSource,networkInfo: mockNetworkInfo );
  });

  group('getConcreteNumberTrivia', () {
  // DATA FOR THE MOCKS AND ASSERTIONS
  // We'll use these three variables throughout all the tests
    const tNumber = 1;
    const NumberTrivia tNumberTrivia = NumberTriviaModel(number: tNumber, text: 'test trivia');
    test('should check if the device is online', () {
      //arrange
      when(() async=> mockNetworkInfo.isConnected).thenAnswer((invocation) async=> true );
      // act
      numberTriviaRepositoryImplementation.getConcreteNumberTrivia(tNumber);
      // assert
    });
  });


  group("device is online", () { 
    setUp(() {
      when(() async => mockNetworkInfo.isConnected ).thenAnswer((invocation) async => true);
    },);
    test("description", () async{});
  });

  group("device is offline", () { 
    setUp(() {
      when(() async => mockNetworkInfo.isConnected ).thenAnswer((invocation) async => false);
    },);
    test("description", () async{});
  });
}

