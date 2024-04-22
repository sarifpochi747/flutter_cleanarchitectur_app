import 'dart:io';

import 'package:clean_architecture_tdd/core/utils/typedef.dart';
import 'package:clean_architecture_tdd/features/blog/domain/entities/blog.dart';

abstract class BlogRepository{

  ResultFuture<Blog> createBlog(
    {
      required String posterId,
      required String title,
      required String content,
      required File image,
      required List<String> topics,
      required DateTime updateAt
    }
  );
  ResultFuture<List<Blog>> getBlogs();
  
}