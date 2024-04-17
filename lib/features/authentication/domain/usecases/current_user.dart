import 'package:clean_architecture_tdd/core/common/entities/user.dart';
import 'package:clean_architecture_tdd/core/usecases/usecase.dart';
import 'package:clean_architecture_tdd/core/utils/typedef.dart';
import 'package:clean_architecture_tdd/features/authentication/domain/repositories/authentication_repository.dart';

class CurrentUser implements UsecaseWitoutParam<User>{

  final AuthenticationRepository authenticationRepository;

  CurrentUser(this.authenticationRepository);
  @override
  ResultFuture<User> call() {
    throw UnimplementedError();
  }
}