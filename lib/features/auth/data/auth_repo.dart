import 'package:dio/dio.dart';
import 'package:hungry/core/network/api_error.dart';
import 'package:hungry/core/network/api_except.dart';
import 'package:hungry/core/network/api_services.dart';

import '../../../core/utils/pref_helper.dart';
import 'user_model.dart';

class AuthRepo {
  ApiServices apiServices = ApiServices();

  //login
  Future<UserModel?> login(String email, String password) async {
    try {
      final response = await apiServices.post('/login', {
        'email': email,
        'password': password,
      });

      if (response is ApiError) {
        throw response;
      }
      if(response is Map<String,dynamic> ){
        final msg = response['message'];
        final code = response['code'];
        final data = response['data'];
        if (code != 200 || data == null) {
          throw ApiError(message: msg);
        }
         final user = UserModel.fromJson(response['data']);
      if (user.token != null) {
        await PrefHelper.saveToken(user.token!);
      }
      return user;
      } else {
        throw ApiError(message: 'UnExpected error from Server');
      }

     
    } on DioError catch (e) {
      throw ApiExcept.handleError(e);
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }
}
