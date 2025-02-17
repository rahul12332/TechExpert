import 'package:dio/dio.dart';

import '../constant/api_constant.dart';
import '../error/server_error.dart';
import 'interceptor.dart';

class ApiClient {
  late final Dio _dio;

  ApiClient()
      : _dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            headers: {
              'Content-Type': 'application/json; charset=UTF-8',
            },
            responseType: ResponseType.json,
            sendTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
          ),
        )..interceptors.add(LoggerInterceptor()); // Attach LoggerInterceptor

  // Method to update headers dynamically (for future token support)
  void updateHeaders(Map<String, String> headers) {
    _dio.options.headers.addAll(headers);
  }

  // GET METHOD
  Future<Response> getRequest(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (e) {
      throw ServerError.fromDioError(e);
    } catch (e) {
      throw ServerError(message: "Unexpected error occurred");
    }
  }
}
