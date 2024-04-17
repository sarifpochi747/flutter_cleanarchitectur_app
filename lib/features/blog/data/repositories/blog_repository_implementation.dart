import 'package:clean_architecture_tdd/core/utils/typedef.dart';
import 'package:clean_architecture_tdd/features/blog/domain/entities/blog.dart';
import 'package:clean_architecture_tdd/features/blog/domain/repositories/blog_repository.dart';

class BlogRespositoryImplementation implements BlogRepository{
  @override
  ResultFuture<Blog> createBlog({required String posterId, required String title, required String content, required String imageUrl, required List<String> topics, required DateTime updateAt}) {
    // TODO: implement createBlog
    throw UnimplementedError();
  }

  @override
  ResultVoid deleteBlog({required String id}) {
    // TODO: implement deleteBlog
    throw UnimplementedError();
  }

  @override
  ResultFuture<List<Blog>> getBlogs() {
    // TODO: implement getBlogs
    throw UnimplementedError();
  }

  @override
  ResultFuture<Blog> updateBlog({required String posterId, required String title, required String content, required String imageUrl, required List<String> topics, required DateTime updateAt}) {
    // TODO: implement updateBlog
    throw UnimplementedError();
  }

}