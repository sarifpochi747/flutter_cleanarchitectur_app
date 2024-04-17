part of 'blog_bloc.dart';

sealed class BlogState extends Equatable {
  const BlogState();
  
  @override
  List<Object> get props => [];
}

final class BlogInitial extends BlogState {}
