import 'package:dio/dio.dart';
import 'package:hungry/core/network/api_except.dart';
import 'package:hungry/core/network/dio_client.dart';

class ApiServices {
  final DioClient _dioClient = DioClient();

  Future<dynamic> get(String endPoint) async {
    try {
      final response = await _dioClient.dio.get(endPoint);
      return response.data;
    } on DioError catch (e) {
      return ApiExcept.handleError(e);
    }
  }
  Future<dynamic> post(String endPoint, Map<String, dynamic> body) async {
    try {
      final response = await _dioClient.dio.post(endPoint,data: body);
      return response.data;
    } on DioError catch (e) {
      return ApiExcept.handleError(e);
    }
  }
  Future<dynamic> put(String endPoint, Map<String, dynamic> body) async {
    try {
      final response = await _dioClient.dio.put(endPoint,data: body);
      return response.data;
    } on DioError catch (e) {
      return ApiExcept.handleError(e);
    }
  }
  Future<dynamic> delete(String endPoint, Map<String, dynamic> body) async {
    try {
      final response = await _dioClient.dio.delete(endPoint,data: body);
      return response.data;
    } on DioError catch (e) {
      return ApiExcept.handleError(e);
    }
  }

}
