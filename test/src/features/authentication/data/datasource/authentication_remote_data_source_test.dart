

import 'package:clean_architecture_tdd/features/authentication/data/datasource/authentication_remote_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class MockClient extends Mock implements SupabaseClient{


}

void main(){


  late SupabaseClient supabaseClient;
  late AuthenticationRemoteDataSource authenticationRemoteDataSource;

  setUp(() {
    supabaseClient = MockClient();
    authenticationRemoteDataSource = AuthenticationRemoteDataSourceImplementation(supabaseClient);
  });


  group("createUser", ()  { 
    test("should complete successfully when the status code is 200 or  201", () async{
    });

    final methodCall = authenticationRemoteDataSource.createUser;

    expect(()=> methodCall(password: "password", name: "name", email: "email"), completes);
    
  });


}