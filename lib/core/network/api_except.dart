import 'package:dio/dio.dart';
import 'package:hungry/core/network/api_error.dart';

class ApiExcept {
  static ApiError handleError(DioError error) {
    final statusCode = error.response?.statusCode;
    final data = error.response?.data;

    if (data is Map<String, dynamic> && data['message'] != null){
      return ApiError(message: data['message'], statusCode: statusCode);
    } 
    switch (error.type) {
      case DioErrorType.connectionTimeout:
        return ApiError(message: 'Connection timeout with ApiServer');
      case DioErrorType.sendTimeout:
        return ApiError(message: 'Send timeout with ApiServer');
      case DioErrorType.receiveTimeout:
        return ApiError(message: 'Receive timeout with ApiServer');
      case DioErrorType.badResponse:
        return ApiError(message: 'Received invalid status code: ${error.response?.statusCode}');
      case DioErrorType.cancel:
        return ApiError(message: 'Request to ApiServer was canceled');
      case DioErrorType.unknown:
        return ApiError(message: 'Connection to ApiServer failed due to internet connection');
      case DioExceptionType.badCertificate:
        return ApiError(message: 'Bad certificate');
      case DioExceptionType.connectionError:
        return ApiError(message: 'Connection error');
      default:
        return ApiError(message: 'Unexpected error occurred, please try again later.');
    }
  }
   
}