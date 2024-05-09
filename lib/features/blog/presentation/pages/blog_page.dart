import 'package:clean_architecture_tdd/core/common/widgets/loader.dart';
import 'package:clean_architecture_tdd/core/theme/app_pallete.dart';
import 'package:clean_architecture_tdd/core/utils/show_snackbar.dart';
import 'package:clean_architecture_tdd/features/blog/domain/entities/blog.dart';
import 'package:clean_architecture_tdd/features/blog/presentation/bloc/blog_bloc.dart';
import 'package:clean_architecture_tdd/features/blog/presentation/pages/add_new_blog.dart';
import 'package:clean_architecture_tdd/features/blog/presentation/pages/blog_viewer_page.dart';
import 'package:clean_architecture_tdd/features/blog/presentation/widgets/blog_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlogPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const BlogPage());
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<BlogBloc>().add(BlogFetchAllBlogs());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "App Blog",
          style: TextStyle(fontSize: 20),
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.push(context, AddNewBlog.route());
              },
              icon: const Icon(Icons.add_circle_outline))
        ],
      ),
      body: BlocConsumer<BlogBloc, BlogState>(
        listener: (context, state) {
          if (state is BlogFailure) {
            return showSnackBar(context, state.message);
          }
        },
        builder: (context, state) {
          if (state is BlogLoading) {
            return const LoaderWidget();
          }
          if (state is BlogDisplaySuccess) {
            return ListView.builder(
                itemCount: state.blogs.length.toInt(),
                itemBuilder: (context, index) {
                  final blog = state.blogs.elementAt(index);
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, BlogViewerPage.route(blog));
                      },
                      child: BlogCard(
                        blog: blog,
                        color: index % 2 == 0
                            ? AppPallete.gradient1
                            : AppPallete.gradient2,
                      ),
                    ),
                  );
                });
          }
          return const SizedBox();
        },
      ),
    );
  }
}
