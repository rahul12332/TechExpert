import 'package:dio/dio.dart';

import '../constant/api_constant.dart';
import '../error/server_error.dart'; // Updated error handling

class ApiClient {
  final Dio _dio;

  ApiClient({Dio? dio}) : _dio = dio ?? Dio(BaseOptions(baseUrl: baseUrl));

  Future<Response> getRequest(String endpoint) async {
    try {
      final response = await _dio.get(endpoint);
      return response;
    } on DioException catch (e) {
      throw ServerError.fromDioError(e); // Use the new error handler
    } catch (e) {
      throw ServerError(message: "Unexpected error occurred");
    }
  }
}
