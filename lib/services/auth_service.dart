import 'package:app_bluestorm/model/user.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthService extends GetxController {
  String url = 'https://djbnrrib9e.execute-api.us-east-2.amazonaws.com/v1';

  Dio dio = Dio();

  Future<void> getAuth({User user, Function onSuccess, Function onFail}) async {
    try {
      dynamic response = await dio.post(
        '$url/login',
        data: user.toMap(),
      );

      Map<String, dynamic> map = response.data;
      var token = map.values;

      onSuccess();
    } on DioError catch (e) {
      onFail(e.message);
    }
  }
}
