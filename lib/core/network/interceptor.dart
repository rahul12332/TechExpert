import 'package:dio/dio.dart';

class LoggerInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print("🚀 [REQUEST] ${options.method} ${options.uri}");
    print("Headers: ${options.headers}");
    if (options.data != null) {
      print("Body: ${options.data}");
    }
    return handler.next(options); // Continue the request
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print("✅ [RESPONSE] ${response.statusCode} ${response.data}");
    return handler.next(response); // Continue the response
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print("❌ [ERROR] ${err.response?.statusCode} ${err.message}");
    return handler.next(err); // Pass error to the next handler
  }
}
