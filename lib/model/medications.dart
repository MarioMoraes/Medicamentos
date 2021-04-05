import 'dart:convert';

import 'package:app_bluestorm/helpers/singleton.dart';
import 'package:app_bluestorm/model/MedicationsModel.dart';
import 'package:app_bluestorm/services/auth_service.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Medications extends GetxController {
  String query = "";
  int pg = 1;
  int limit = 20;
  String token;

  List<MedicationsModel> listMedications;

  AuthService authService = AuthService();
  Dio dio = Dio();

  @override
  void onReady() {
    super.onReady();
    listMedications = getAllMedications() as List<MedicationsModel>;
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

      var resultado = response.data;

      listMedications =
          MedicationsModel.fromJson(resultado) as List<MedicationsModel>;
      print(resultado);
    } on DioError catch (e) {
      print(e.message);
    }
  }

  void getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
  }
}
