part of 'blog_bloc.dart';

sealed class BlogEvent extends Equatable {
  const BlogEvent();

  @override
  List<Object> get props => [];
}


class BlogCreateBlog extends BlogEvent{
  final String postId;
  final String title;
  final String content;
  final File imageUrl;
  final List<String> topics;

 const BlogCreateBlog({required this.postId, required this.title, required this.content, required this.imageUrl, required this.topics});

}

class BlogFetchAllBlogs extends BlogEvent{

}

class DeleteBlog extends BlogEvent{}
