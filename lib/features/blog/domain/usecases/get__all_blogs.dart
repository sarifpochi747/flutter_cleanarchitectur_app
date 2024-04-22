import 'package:clean_architecture_tdd/core/error/execeptions.dart';
import 'package:clean_architecture_tdd/core/error/failures.dart';
import 'package:clean_architecture_tdd/core/usecases/usecase.dart';
import 'package:clean_architecture_tdd/core/utils/typedef.dart';
import 'package:clean_architecture_tdd/features/blog/domain/entities/blog.dart';
import 'package:clean_architecture_tdd/features/blog/domain/repositories/blog_repository.dart';




class GetAllBlogs extends UsecaseWitoutParam<List<Blog>>{
  final BlogRepository blogRepository;

  GetAllBlogs(this.blogRepository);

  @override
  ResultFuture<List<Blog>> call() async{
    try {
      final blogs = await blogRepository.getBlogs();
      return blogs;
    } on APIException catch (e) {
      throw APIFailure.fromException(e);
    }catch (e){
      throw APIException(message: e.toString());
    }
  }
}