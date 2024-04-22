import 'dart:io';

import 'package:clean_architecture_tdd/core/error/execeptions.dart';
import 'package:clean_architecture_tdd/core/error/failures.dart';
import 'package:clean_architecture_tdd/core/usecases/usecase.dart';
import 'package:clean_architecture_tdd/core/utils/typedef.dart';
import 'package:clean_architecture_tdd/features/blog/domain/entities/blog.dart';
import 'package:clean_architecture_tdd/features/blog/domain/repositories/blog_repository.dart';
import 'package:uuid/uuid.dart';

class CreateBlog extends Usecase<Blog,Params>{

  final BlogRepository blogRepository;
  Uuid uuid = const Uuid();

  CreateBlog({required this.blogRepository}); 

  @override
  ResultFuture<Blog> call(Params params) async {
    try {
      final result = await blogRepository.createBlog(posterId: params.posterId, title: params.title, content: params.content, image: params.image, topics: params.topics, updateAt: DateTime.now());
      return result;
    }on APIException catch (e) {
      throw APIFailure.fromException(e);
    }catch (e){
      throw APIException(message: e.toString());
    }
  }
  
}

class Params {
  final String posterId;
  final String title;
  final String content;
  final File image;
  final List<String> topics;

  Params(this.posterId,this.title, this.content, this.image, this.topics, );

}