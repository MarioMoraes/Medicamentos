import 'package:app_bluestorm/helpers/singleton.dart';
import 'package:app_bluestorm/model/medications.dart';
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

      // Save Token
      Map<String, dynamic> map = response.data;
      token = map.values.first;
      saveInstance();

      /////
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["Authorization"] = "Bearer $token";

      String query = 'Eritromicina';

      response = await dio.get(
          'https://djbnrrib9e.execute-api.us-east-2.amazonaws.com/v1/medications?query=$query&page=1&limit=30');
      print(response.data);

      onSuccess();
    } on DioError catch (e) {
      onFail(e.message);
    }
  }

  void saveInstance() {
    var singleton = Singleton.instance;
    singleton.tokenData = token;
  }
}
