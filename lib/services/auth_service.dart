import 'package:dio/dio.dart';

class AuthService {
  String url = '';
  Dio dio;

  Future<void> getAuth() async {
    Response response = await dio.post('$url/login',
        data: {'username': 'johndoe', 'password': 'password'});
    if (response.statusCode == 200) print('Logado!!!!');
  }
}
