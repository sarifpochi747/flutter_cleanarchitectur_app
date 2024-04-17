
import 'package:clean_architecture_tdd/core/error/execeptions.dart';
import 'package:clean_architecture_tdd/core/error/failures.dart';
import 'package:clean_architecture_tdd/features/authentication/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthenticationRemoteDataSource{
  

  Future<void> createUser({
    required String password,
    required String name,
    required String email
  });


  Future<List<UserModel>> getUsers();

  Future<UserModel> signUpWithEmailPassword({
    required String name,required String email,required String password
  });

  Future<UserModel> signInWithEmailPassword({
    required String email,required String password
  });

}



//connect with internet // require api
class AuthenticationRemoteDataSourceImplementation implements AuthenticationRemoteDataSource{
  
  final SupabaseClient supabaseClient;
  AuthenticationRemoteDataSourceImplementation(this.supabaseClient);

  // 1. check to make sure that it returns the right data when the status code 200 
  // 2. check to make sure that it "THROWS A CUSTOM EXCEPTION" with the right message when status code is the bad one
  @override
  Future<void> createUser({required String password, required String name, required String email}) async{
    throw UnimplementedError();
  }

  @override
  Future<List<UserModel>> getUsers() {
    throw UnimplementedError();
  }
  
  @override
  Future<UserModel> signInWithEmailPassword({required String email, required String password}) async {
    try {
      
      final response = await supabaseClient.auth.signInWithPassword(password: password,email: email);
      if(response.user == null){
        throw const APIException(message: "user nul!!", statusCode:404 );
      }
      return UserModel.fromMap(response.user!.toJson());
    } on APIException catch (e) {
      throw APIFailure.fromException(e);
    }
  }
  
  @override
  Future<UserModel> signUpWithEmailPassword({required String name, required String email, required String password}) async{
    try {
      final res = await  supabaseClient.auth.signUp(password: password,email: email,data: {
        "name":name
      });
      if(res.user == null){
        throw const APIException(message: "user is null", statusCode: 404);
      }
      return UserModel.fromMap(res.user!.toJson());
    } on APIException catch  (e) {
      throw APIFailure.fromException(e);
    }
  }
}