import 'package:dio/dio.dart';

class ServerError implements Exception {
  final String message;
  final int? errorCode;

  ServerError({required this.message, this.errorCode});

  factory ServerError.fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ServerError(message: "Connection timeout");
      case DioExceptionType.receiveTimeout:
        return ServerError(message: "Receive timeout in connection");
      case DioExceptionType.sendTimeout:
        return ServerError(message: "Send timeout in request");
      case DioExceptionType.connectionError:
        return ServerError(message: "Connection failed. Check your internet.");
      case DioExceptionType.badResponse:
        return ServerError(
          message: error.response?.data['msg'] ?? "Something went wrong",
          errorCode: error.response?.statusCode,
        );
      default:
        return ServerError(message: "Unexpected error occurred");
    }
  }

  @override
  String toString() => message;
}
