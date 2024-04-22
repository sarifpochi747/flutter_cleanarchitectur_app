import 'package:equatable/equatable.dart';

class APIException extends Equatable implements Exception{

  final String message;
  final int statusCode;

  const APIException({required this.message, this.statusCode = 500});
  
  @override
  List<Object?> get props =>[message,statusCode];
  
}

