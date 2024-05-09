import 'package:clean_architecture_tdd/features/blog/domain/entities/blog.dart';
import 'package:flutter/material.dart';

class BlogViewerPage extends StatelessWidget {
  static route(Blog blog) => MaterialPageRoute(
    builder: (context)=> BlogViewerPage(blog: blog,));
  final Blog blog;
  const BlogViewerPage({super.key, required this.blog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Text(blog.title),
            Text("By Charif"),
            Text("2 Mar, 2024, 1 min"),
            Image.network("https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg")
            
          ],
        ),
      ),
    );
  }
}