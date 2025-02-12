import 'package:cubit_task/presentation/widgets/post_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/helper/internet_connection_checker.dart';
import '../cubit/post_cubit.dart';
import '../cubit/post_state.dart';

class PostListPage extends StatefulWidget {
  @override
  State<PostListPage> createState() => _PostListPageState();
}

class _PostListPageState extends State<PostListPage> {
  final InternetChecker _internetChecker = InternetChecker();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _internetChecker.monitorConnection(context); // ✅ Moved inside `Scaffold`
    });
  }

  @override
  Widget build(BuildContext context) {
    context.read<PostCubit>().fetchPosts();

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Posts',
            style: TextStyle(color: Colors.white),
          )),
      body: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          if (state is PostLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is PostLoaded) {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                final post = state.posts[index];
                return PostCard(
                  title: post.title,
                );
              },
            );
          } else if (state is PostError) {
            return Center(child: Text(state.message));
          }
          return Center(child: Text('Somethings wents wrong'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<PostCubit>().fetchPosts();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
