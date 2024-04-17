


import 'package:clean_architecture_tdd/core/error/failures.dart';
import 'package:dartz/dartz.dart';

typedef ResultFuture<Type>  = Future<Either<Failure,Type>>;
typedef ResultVoid  = ResultFuture<void>;

typedef DataMap = Map<String ,dynamic>;