import 'package:app_bluestorm/helpers/singleton.dart';
import 'package:app_bluestorm/model/user.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AuthService extends GetxController {
  String token = "";
  final Dio dio = Dio();
  final String url =
      'https://djbnrrib9e.execute-api.us-east-2.amazonaws.com/v1';

  Future<void> getAuth({User user, Function onSuccess, Function onFail}) async {
    try {
      dynamic response = await dio.post(
        '$url/login',
        data: user.toMap(),
      );

      Map<String, dynamic> map = response.data;
      dynamic tk = map.values;
      token = tk.toString();

      int tam = token.length;
      String x = token.substring(1, tam - 1);
      token = x;

      saveInstance();

      onSuccess();
    } on DioError catch (e) {
      onFail(e.message);
    }
  }

  void saveInstance() {
    var s1 = Singleton.instance;
    s1.tokenData = token;
  }
}
