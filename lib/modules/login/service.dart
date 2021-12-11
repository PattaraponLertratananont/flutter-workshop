import 'package:dio/dio.dart';
import 'package:flutter_exam/client.dart';
import 'package:flutter_exam/modules/login/model.dart';

class LoginService {
  Future<UserModel> getUserProfile(String username, String password) async {
    try {
      Response response = await HttpClient().get("/users/1");
      return UserModel.fromJson(response.data);
    } catch (e) {
      print("getUserProfile $e");
      throw e;
    }
  }
}
