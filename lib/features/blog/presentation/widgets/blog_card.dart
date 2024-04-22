import 'package:clean_architecture_tdd/core/utils/calculator_reading_time.dart';
import 'package:clean_architecture_tdd/features/blog/domain/entities/blog.dart';
import 'package:flutter/material.dart';

class BlogCard extends StatelessWidget {
  final Blog blog;
  final Color color;
  const BlogCard({  super.key, required this.blog, required this.color});

  @override
  Widget build(BuildContext context)
  {
    return 
      Container(
        height: 250,
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius:BorderRadius.circular(10)
        ),
        child:  Padding(
          padding: const EdgeInsets.fromLTRB(10,5,10,10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                // physics: const BouncingScrollPhysics(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: blog.topics.map((e) => Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Chip(
                      label: Text(e),
                      ),
                  ),
                  ).toList()
                  ,            
                ),
              ),
              Text(blog.content,
                style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              const Text("1 min")
            ],
          ),
        ),
      );
  }
}