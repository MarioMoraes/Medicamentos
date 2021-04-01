import 'package:app_bluestorm/model/user.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AuthService extends GetxController {
  String token;
  String url = 'https://djbnrrib9e.execute-api.us-east-2.amazonaws.com/v1';
  Dio dio = Dio();

  Future<void> getAuth({User user, Function onSuccess, Function onFail}) async {
    try {
      dynamic response = await dio.post(
        '$url/login',
        data: user.toMap(),
      );

      token = response.data['token'];
      update();

      onSuccess();
    } on DioError catch (e) {
      onFail(e.message);
    }
  }
}
