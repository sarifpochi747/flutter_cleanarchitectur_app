// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:clean_architecture_tdd/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:clean_architecture_tdd/core/common/widgets/loader.dart';
import 'package:clean_architecture_tdd/core/theme/app_pallete.dart';
import 'package:clean_architecture_tdd/core/utils/pick_image.dart';
import 'package:clean_architecture_tdd/core/utils/show_snackbar.dart';
import 'package:clean_architecture_tdd/features/blog/presentation/bloc/blog_bloc.dart';
import 'package:clean_architecture_tdd/features/blog/presentation/pages/blog_page.dart';
import 'package:clean_architecture_tdd/features/blog/presentation/widgets/blog_field.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNewBlog extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const AddNewBlog());
  const AddNewBlog({super.key});

  @override
  State<AddNewBlog> createState() => _AddNewBlogState();
}

class _AddNewBlogState extends State<AddNewBlog> {
  final blogTitleController = TextEditingController();
  final blogContentController = TextEditingController();
  final List<String> seletedTopics = [];
  final _formKey = GlobalKey<FormState>();
  File? image;
  @override
  void dispose() {
    super.dispose();
    blogTitleController.dispose();
    blogContentController.dispose();
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

  void createBlog() {
    if (_formKey.currentState!.validate() &&
      seletedTopics.isNotEmpty &&
      image != null) {
    // final postId =(context.read<AppUserCubit>().state as AppUserLoggedIn).user.id;
      context.read<BlogBloc>().add(BlogCreateBlog(
          postId: "postId",
          title: blogTitleController.text.trim(),
          content: blogContentController.text.trim(),
          imageUrl: image!,
          topics: seletedTopics
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              onPressed: createBlog, icon: const Icon(Icons.done_rounded)),
        ],
      ),
      body: BlocConsumer<BlogBloc, BlogState>(
        listener: (context, state) {
          if(state is BlogFailure){
            showSnackBar(context, state.message);
          }else if(state is BlogCreateSuccess){
            Navigator.pushAndRemoveUntil(context, BlogPage.route(), (route) => false);
          }
        },
        builder: (context, state) {
          if(state is BlogLoading){
            return LoaderWidget();
          }

          return Form(
            key: _formKey,
            child: SingleChildScrollView(
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
                      controller: blogTitleController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    BlogField(
                      placeHolder: "Blog Content",
                      controller: blogContentController,
                    ),
                    SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
