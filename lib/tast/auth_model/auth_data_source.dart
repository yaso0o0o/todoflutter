import 'package:dio/dio.dart';
import 'package:flutter_application_1/tast/auth_model/login_model.dart';
import 'package:flutter_application_1/tast/network/dio_helper.dart';
import 'package:flutter_application_1/tast/network/end_point.dart';

class AuthDataSource {
  Future<LoginModel> login({required LoginParameters loginParameters}) async {
    try {
      final Response response = await DioHelper.postData(
          endPointPath: EndPoints.login, data: loginParameters.toMap());
      return LoginModel.fromMap(response.data);
    } catch (error) {
      rethrow;
    }
  }
}
