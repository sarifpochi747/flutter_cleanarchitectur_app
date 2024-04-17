import 'package:bloc/bloc.dart';
import 'package:clean_architecture_tdd/core/common/entities/user.dart';
import 'package:equatable/equatable.dart';

part 'app_user_state.dart';

// part of logic 

class AppUserCubit extends Cubit<AppUserState> {
  AppUserCubit() : super(AppUserInitial());


  void updateUser(User? user){
    if(user == null){
      emit(AppUserInitial());
    }else{
      emit(AppUserLoggedIn(user: user));
    }
  }
}


