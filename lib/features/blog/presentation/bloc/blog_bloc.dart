import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:clean_architecture_tdd/core/error/failures.dart';
import 'package:clean_architecture_tdd/features/blog/domain/entities/blog.dart';
import 'package:clean_architecture_tdd/features/blog/domain/usecases/create_blog.dart';
import 'package:clean_architecture_tdd/features/blog/domain/usecases/get__all_blogs.dart';
import 'package:equatable/equatable.dart';

part 'blog_event.dart';
part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final GetAllBlogs _getAllBlogs;
  final CreateBlog _createBlog;
  BlogBloc(this._getAllBlogs, this._createBlog) : super(BlogInitial()) {
    on<BlogEvent>((event, emit) => emit(BlogLoading()));
    on<BlogFetchAllBlogs>(_blogFetchAllBlogs);
    on<BlogCreateBlog>(_blogCreateBlog);
  }

  FutureOr<void> _blogFetchAllBlogs(BlogFetchAllBlogs event, Emitter<BlogState> emit) async{
    final resulte = await  _getAllBlogs.call();
    resulte.fold(
      (l) => _emitBlogFailure(l, emit), 
      (r) {
        emit(BlogDisplaySuccess(r));
      });
    
  }


  void _emitBlogFailure(Failure failure,Emitter emit){
    print(failure);
    emit(BlogFailure(failure.message, failure.statusCode));
  }



  Future<FutureOr<void>> _blogCreateBlog(BlogCreateBlog event, Emitter<BlogState> emit) async {
    final result = await _createBlog.call(Params(event.postId,event.title, event.content, event.imageUrl, event.topics));
    result.fold(
      (l) => _emitBlogFailure(l, emit), 
      (r) {

        emit(BlogCreateSuccess());
      });
  }
}
