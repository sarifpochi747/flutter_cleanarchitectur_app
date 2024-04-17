
import 'package:clean_architecture_tdd/features/blog/presentation/pages/add_new_blog.dart';
import 'package:flutter/material.dart';

class BlogPage extends StatefulWidget {
  static route()=> MaterialPageRoute(builder: (context)=> const BlogPage());
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "App Blog",style: TextStyle(fontSize: 20),
        ),
        actions: <Widget>[
          IconButton(
            onPressed:(){
              Navigator.push(context, AddNewBlog.route() );
            } , 
            icon:const Icon(Icons.add_circle_outline) 
          )
        ],
      ),
    );
  }
}