import 'package:dio/dio.dart';

import '../../core/constant/api_constant.dart';
import '../../core/error/server_error.dart';
import '../../core/network/api_client.dart';
import '../model/post_model.dart';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> fetchPosts();
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final ApiClient apiClient;

  PostRemoteDataSourceImpl(this.apiClient);

  @override
  Future<List<PostModel>> fetchPosts() async {
    try {
      final response = await apiClient.getRequest(posts);
      List<dynamic> data = response.data;
      return data.map((json) => PostModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw ServerError.fromDioError(e);
    }
  }
}
