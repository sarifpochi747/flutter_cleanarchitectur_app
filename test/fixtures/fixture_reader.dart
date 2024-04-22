import 'dart:io';

String fixture(String filename){
  // return  File("test/fixtures/$filename").readAsStringSync();
  return  File("C:/Users/sarif/Desktop/clean_architecture_tdd/test/fixtures/trivia.json").readAsStringSync();
}