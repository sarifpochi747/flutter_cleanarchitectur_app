

import 'dart:convert';
import 'package:clean_architecture_tdd/core/utils/typedef.dart';
import 'package:clean_architecture_tdd/features/authentication/data/models/user_model.dart';
import 'package:clean_architecture_tdd/features/authentication/domain/entities/user.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../fixtures/fixture_reader.dart';


// use group test
void main(){
  
    const tModel = UserModel(id: "1", name: "sarif", email: "email", password: "4/4/2024");

  setUp(() {});


  //test subclass
  test("should be a subclass of User entity", () async{

    // arrange 


    //act


    // assert
    expect(tModel, isA<User>());

  });
  final tJson =fixture("users.json");
  final tMap = jsonDecode(tJson) as DataMap;
  print(tMap);
  // test group
  group("fromMap", () { 
    test("should return a [UserModel] with right data", () async {
      
      // act
      final result =  UserModel.fromMap(tMap);
      //assert 
      expect(result, equals(tModel));


    });
  });

  group("fromJson", () { 
    test("should return a {UserModel} with the right data", () async {

        final result = UserModel.fromJson(tJson);
        expect(result, equals(tModel));

    });
  });


  group("toMap", () { 
    test("should return a [Map] with the right data ", () async {


      // act 
      final result = tModel.toMap();
      //assert
      expect(result, equals(tMap));
    });
  });
  group("toJson", () { 
    test("should return a [Json] with the right data ", () async {


      // act 
      final result = tModel.toJson();
      final tJson = jsonEncode(
        {
          "id": "1",
          "name": "sarif",
          "password": "4/4/2024",
          "email": "email"
        }
      );
      
      //assert
      expect(result, equals(tJson));
    });
  });

  group("copyWith", () { 
    test("should return array", () async {
      final result = tModel.copyWith(name: "pochi");

      expect(result.name, equals("pochi"));
    });
  });
    
}