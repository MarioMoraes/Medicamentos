import 'package:app_bluestorm/helpers/singleton.dart';
import 'package:app_bluestorm/model/user.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AuthService extends GetxController {
  String token = "";
  final Dio dio = Dio();
  final String url =
      'https://djbnrrib9e.execute-api.us-east-2.amazonaws.com/v1';

  var isLoading = false.obs;

  Future<void> getAuth({User user, Function onSuccess, Function onFail}) async {
    try {
      isLoading(true);
      dynamic response = await dio.post(
        '$url/login',
        data: user.toMap(),
      );

      // Save Token
      Map<String, dynamic> map = response.data;
      token = map.values.first;
      saveInstance();

      onSuccess();
    } on DioError catch (e) {
      onFail(e.message);
    }
    isLoading(false);
  }

  void saveInstance() {
    var singleton = Singleton.instance;
    singleton.tokenData = token;
  }
}
