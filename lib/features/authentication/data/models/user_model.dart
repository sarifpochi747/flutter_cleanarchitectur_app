import 'dart:convert';
import 'package:clean_architecture_tdd/core/common/entities/user.dart';
import 'package:clean_architecture_tdd/core/utils/typedef.dart';

class UserModel extends User {
    UserModel(
    {
      required super.id, 
      required super.name, 
      required super.email,
    }
  );



  UserModel.fromMap(DataMap map)
  :this(
        email: map["email"] as String,
        id: map["id"] as String,
        name: map["name"] as String,
  );


 String toJson() => json.encode(toMap()) ;

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as DataMap);

  DataMap toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }
  


  UserModel copyWith({String? id,String? name, String? password,String? email }){
    return UserModel(id: id?? this.id, name: name?? this.name, email: email?? this.email);
  }
}