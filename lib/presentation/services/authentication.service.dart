import 'package:dio/dio.dart';

import '../../config/services/local_storage.dart';

class AuthenticationService {
  String _BASE_URL = "https://stslab.qhanati.com/websda/api";
  @override
  Future<String> registerUser(String userName, String email, String password) async{
    try {
      final Dio dio = Dio();
      final Response response = await dio.post(
        '$_BASE_URL/appuser/register',
        data: {
          'UserName': userName,
          'Email': email,
          'Password': password,
        });
      return (response.statusCode == 201) ? 'Success' : 'Error Code ${response.statusCode}';
    } catch (e) {
      return e.toString();
    }
  }

  @override
  Future<String> loginUser(String email, String password) async {
    try {
      final Dio dio = Dio();
      final Response response = await dio.post(
        '$_BASE_URL/appuser/login',
        data: {
          'Email': email,
          'Password': password,
        });
      if(response.statusCode == 200 || response.statusCode == 201) {
        //FIXME: FM Save JWT in storage for add in header.
        LocalStorage().setIsLoggedIn(true);
      }
      return (response.statusCode == 200 || response.statusCode == 201) ? 'Success' : 'Error Code ${response.statusCode}';
    } catch (e) {
      return '${e.toString()}';
    }
  }
}