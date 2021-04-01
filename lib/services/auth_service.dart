import 'package:app_bluestorm/model/user.dart';
import 'package:dio/dio.dart';

class AuthService {
  String url = 'https://djbnrrib9e.execute-api.us-east-2.amazonaws.com/v1';
  Dio dio = Dio();

  Future<void> getAuth(User user) async {
    Response response = await dio.post(
      '$url/login',
      data: user.toMap(),
    );
    if (response.statusCode == 200) print('Logado!!!!');
  }
}
