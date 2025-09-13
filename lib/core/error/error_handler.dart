import 'package:dio/dio.dart';

import '../global/global_exports.dart';


class ErrorHandler {
  static String getErrorMessage(dynamic error) {
    if (error is DioException) {
      final res = error.response;

      if (res != null && res.data is Map<String, dynamic>) {
        final data = res.data as Map<String, dynamic>;
        return data['message'] ?? data['error'] ?? strings (context).serverError;
      }

      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
          return strings (context).timeout;
        case DioExceptionType.badResponse:
          return strings (context).badResponse;
        case DioExceptionType.cancel:
          return strings (context).cancelled;
        case DioExceptionType.connectionError:
          return strings (context).connectionError;
        default:
          return strings (context).unexpectedError;
      }
    }

    return strings (context).unknownError;
  }
}
