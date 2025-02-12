import '../../core/error/server_error.dart';
import '../../domain/entities/post.dart';
import '../../domain/repositories/post_repository.dart';
import '../datasource/post_remote_data_source.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;

  PostRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Post>> getPosts() async {
    try {
      final posts = await remoteDataSource.fetchPosts();
      return posts; // Returning fetched posts
    } catch (e) {
      throw ServerError(message: e.toString()); // Throwing ServerError
    }
  }
}
