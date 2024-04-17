import 'package:clean_architecture_tdd/core/utils/typedef.dart';


//type เป็นประเภทของ usecase ที่จะ reture
//param  เป็นประเภทของ paremeter
abstract class Usecase<Type,Params>{

  ResultFuture<Type> call(Params params);
}


abstract class UsecaseWitoutParam<Type>{

  ResultFuture<Type> call();
}