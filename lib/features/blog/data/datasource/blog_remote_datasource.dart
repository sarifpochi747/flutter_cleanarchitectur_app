import 'dart:convert';
import 'dart:io';

import 'package:clean_architecture_tdd/core/error/execeptions.dart';
import 'package:clean_architecture_tdd/core/error/failures.dart';
import 'package:clean_architecture_tdd/core/fixtures/fixture_reader_file.dart';
import 'package:clean_architecture_tdd/features/blog/data/models/blog_model.dart';


abstract class BlogRemoteDataSource{
    Future<BlogModel> createBlog(BlogModel blogModel);
  Future<List<BlogModel>> getBlogs();
  Future<String> uploadBlogImage(File image,BlogModel blogModel);
}

class BlogRemoteDataSourceImplementation implements BlogRemoteDataSource{
  @override
  Future<BlogModel> createBlog(BlogModel blogModel)async {

      try {
        return  blogModel;
      } on APIException catch (e) {
        throw APIFailure.fromException(e);
      }catch(e){
        throw APIException(message: e.toString());
      }

  }


  @override
  Future<List<BlogModel>> getBlogs() async{
    try {
      List<BlogModel> blogs = [];
      final dataJson = await fixture("blog.json");
      if(dataJson.isNotEmpty){
        List jsdecode = jsonDecode(dataJson);
        for(int i=0;i<jsdecode.length;i++){
          blogs.add(BlogModel.fromMap(jsdecode.elementAt(i)));
        }
      }
      return blogs;
    } on APIException catch (e) {
      throw APIFailure.fromException(e);
    }catch (e) {
      throw APIException(message: e.toString());
    }
  }
  
  @override
  Future<String> uploadBlogImage(File image, BlogModel blogModel) {
    throw UnimplementedError();
  }
  
  
  
}