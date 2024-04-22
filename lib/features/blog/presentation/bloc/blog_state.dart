part of 'blog_bloc.dart';

sealed class BlogState extends Equatable {
  const BlogState();
  
  @override
  List<Object> get props => [];
}

final class BlogInitial extends BlogState {}


class BlogLoading extends BlogState{}

class BlogCreateSuccess extends BlogState{}

class BlogDisplaySuccess extends BlogState{
  final List<Blog> blogs;

  const BlogDisplaySuccess(this.blogs);

  
}



class BlogFailure extends BlogState{
  final String message;
  final int statusCode;

  const BlogFailure(this.message, this.statusCode);
}
