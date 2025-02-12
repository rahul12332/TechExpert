import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_posts.dart';
import 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final GetPosts getPosts;

  PostCubit(this.getPosts) : super(PostInitial());

  void fetchPosts() async {
    emit(PostLoading());
    try {
      final posts = await getPosts();
      emit(PostLoaded(posts));
    } catch (e) {
      emit(PostError(e.toString()));
    }
  }
}
