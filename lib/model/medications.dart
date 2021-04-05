import 'package:app_bluestorm/helpers/singleton.dart';
import 'package:app_bluestorm/services/auth_service.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'MedicationsModel.dart';

class Medications extends GetxController {
  String query = "";
  int pg = 1;
  int limit = 20;
  String token;

  var listMedications = [];

  AuthService authService = AuthService();
  Dio dio = Dio();

  @override
  void onReady() {
    super.onReady();
    getAllMedications();
  }

  Future<void> getAllMedications() async {
    try {
      token = Singleton.instance.tokenData;

      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["Authorization"] = "Bearer $token";

      dio.options.queryParameters = {'page': pg, 'limit': limit};

      final response = await dio.get(
          'https://djbnrrib9e.execute-api.us-east-2.amazonaws.com/v1/medications');
      print(response.data);

      listMedications = MedicationsModel.fromJson(response.data) as List;

      print(listMedications);
    } on DioError catch (e) {
      print(e.message);
    }
  }

  void getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
  }
}
