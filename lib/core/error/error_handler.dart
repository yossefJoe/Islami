import 'package:dio/dio.dart';

import '../global/global_exports.dart';


class ErrorHandler {
  static String getErrorMessage(dynamic error) {
    if (error is DioException) {
      final res = error.response;

      if (res != null && res.data is Map<String, dynamic>) {
        final data = res.data as Map<String, dynamic>;
        return data['message'] ?? data['error'] ?? strings.serverError;
      }

      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
          return strings.timeout;
        case DioExceptionType.badResponse:
          return strings.badResponse;
        case DioExceptionType.cancel:
          return strings.cancelled;
        case DioExceptionType.connectionError:
          return strings.connectionError;
        default:
          return strings.unexpectedError;
      }
    }

    return strings.unknownError;
  }
}
