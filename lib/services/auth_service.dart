import 'package:app_bluestorm/model/user.dart';
import 'package:dio/dio.dart';

class AuthService {
  String url = 'https://djbnrrib9e.execute-api.us-east-2.amazonaws.com/v1';
  Dio dio = Dio();

  Future<void> getAuth({User user, Function onSuccess, Function onFail}) async {
    try {
      Response response = await dio.post(
        '$url/login',
        data: user.toMap(),
      );
      print(response.statusMessage);
      onSuccess();
    } on DioError catch (e) {
      onFail(e.message);
    }
  }

  Future<void> getAllMedications() async {
    try {
      Response response = await dio.get('$url/medications');
      print(response.statusMessage);
    } on DioError catch (e) {
      print(e.message);
    }
  }
}
