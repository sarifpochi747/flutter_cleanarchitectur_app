import 'package:clean_architecture_tdd/core/utils/typedef.dart';
import 'package:clean_architecture_tdd/features/blog/domain/entities/blog.dart';

abstract class BlogRemoteDataSource{
    ResultFuture<Blog> createBlog(
    {
      required String posterId,
      required String title,
      required String content,
      required String imageUrl,
      required List<String> topics,
      required DateTime updateAt
    }
  );
  ResultFuture<Blog> updateBlog(
    {
      required String posterId,
      required String title,
      required String content,
      required String imageUrl,
      required List<String> topics,
      required DateTime updateAt
    }
  );
  ResultVoid deleteBlog(
    {
      required String id
    }
  );

  ResultFuture<List<Blog>> getBlogs();
}