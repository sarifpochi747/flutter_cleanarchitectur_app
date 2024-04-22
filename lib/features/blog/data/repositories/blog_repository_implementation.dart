import 'dart:io';

import 'package:clean_architecture_tdd/core/error/execeptions.dart';
import 'package:clean_architecture_tdd/core/error/failures.dart';
import 'package:clean_architecture_tdd/core/utils/typedef.dart';
import 'package:clean_architecture_tdd/features/blog/data/datasource/blog_remote_datasource.dart';
import 'package:clean_architecture_tdd/features/blog/data/models/blog_model.dart';
import 'package:clean_architecture_tdd/features/blog/domain/entities/blog.dart';
import 'package:clean_architecture_tdd/features/blog/domain/repositories/blog_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:uuid/uuid.dart';

class BlogRespositoryImplementation implements BlogRepository{
  final BlogRemoteDataSource blogRemoteDataSourceImplementation;
  Uuid uuid = const Uuid();
  BlogRespositoryImplementation(this.blogRemoteDataSourceImplementation);
  
  @override
  ResultFuture<List<Blog>> getBlogs() async {
    try {
      final blogs = await blogRemoteDataSourceImplementation.getBlogs();
      return right(blogs);
    } on APIException catch (e) {
      return left(APIFailure.fromException(e));
    }
  }

  @override
  ResultFuture<Blog> createBlog({required String posterId, required String title, required String content, required File image, required List<String> topics, required DateTime updateAt}) async {
    try{
      BlogModel blogModel = BlogModel(id: uuid.v1(), posterId: posterId, title: title, content: content, imageUrl: "", topics: topics, updateAt: updateAt);
      // final imageUrl = await blogRemoteDataSourceImplementation.uploadBlogImage(image,blogModel);
      blogModel.copyWith(imageUrl: "imageUrl");
      final result = await blogRemoteDataSourceImplementation.createBlog(blogModel);
      return right(result);
    }on APIException catch (e){
      return left(APIFailure.fromException(e));
    }
  }


}