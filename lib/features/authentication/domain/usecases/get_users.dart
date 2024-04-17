import 'package:clean_architecture_tdd/core/common/entities/user.dart';
import 'package:clean_architecture_tdd/core/usecases/usecase.dart';
import 'package:clean_architecture_tdd/core/utils/typedef.dart';
import 'package:clean_architecture_tdd/features/authentication/domain/repositories/authentication_repository.dart';

class GetUsers extends UsecaseWitoutParam<List<User>>{
  final AuthenticationRepository authenticationRepository;

  GetUsers({required this.authenticationRepository});



  @override
  ResultFuture<List<User>> call() {
    return authenticationRepository.getUsers();
  }

}