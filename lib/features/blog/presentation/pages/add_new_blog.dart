// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:clean_architecture_tdd/core/theme/app_pallete.dart';
import 'package:clean_architecture_tdd/core/utils/pick_image.dart';
import 'package:clean_architecture_tdd/features/blog/presentation/widgets/blog_field.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddNewBlog extends StatefulWidget {
  static route ()=> MaterialPageRoute(builder: (context)=> const AddNewBlog());
  const AddNewBlog({super.key});


  @override
  State<AddNewBlog> createState() => _AddNewBlogState();
}

class _AddNewBlogState extends State<AddNewBlog> {
  final blogTitle = TextEditingController();
  final blogContent = TextEditingController();
  final List<String> seletedTopics = [];
  File? image;
  @override
  void dispose() {
    super.dispose();
    blogTitle.dispose();
    blogContent.dispose();
  }

  Future<void> selectedImage() async {
    final pickedImage = await pickImage();
    if (pickedImage == null) {
      image = null;
    } else {
      setState(() {
        image = pickedImage;
      });
      print(image);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions:<Widget> [
          IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.done_rounded)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            children: [
              image != null
                  ? GestureDetector(
                      onTap: () {
                        selectedImage();
                      },
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.file(
                            image!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        selectedImage();
                      },
                      child: DottedBorder(
                        dashPattern: const [10, 6],
                        strokeWidth: 2,
                        strokeCap: StrokeCap.round,
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(16),
                        color: AppPallete.borderColor,
                        child: Container(
                            height: 200,
                            width: double.infinity,
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.folder_open_rounded,
                                  size: 40,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Select your image",
                                  style: TextStyle(fontSize: 20),
                                )
                              ],
                            )),
                      ),
                    ),
              SizedBox(
                height: 30,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal, // แกน x
                child: Row(
                    children: [
                  "Technology",
                  "Business",
                  "Programming",
                  "Entertainment"
                ]
                        .map((e) => Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: GestureDetector(
                                onTap: () {
                                  if (seletedTopics.contains(e)) {
                                    seletedTopics.remove(e);
                                  } else {
                                    seletedTopics.add(e);
                                  }
                                  setState(() {});
                                },
                                child: Chip(
                                  label: Text(e),
                                  color: seletedTopics.contains(e)
                                      ? const MaterialStatePropertyAll(
                                          AppPallete.gradient1)
                                      : null,
                                  side: seletedTopics.contains(e)
                                      ? null
                                      : BorderSide(
                                          color: AppPallete.borderColor,
                                          style: BorderStyle.solid),
                                ),
                              ),
                            ))
                        .toList()),
              ),
              SizedBox(
                height: 20,
              ),
              BlogField(
                placeHolder: "Blog Title",
                controller: blogTitle,
              ),
              SizedBox(
                height: 10,
              ),
              BlogField(
                placeHolder: "Blog Content",
                controller: blogContent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
