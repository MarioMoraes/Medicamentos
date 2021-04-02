import 'package:app_bluestorm/helpers/singleton.dart';
import 'package:app_bluestorm/model/items.dart';
import 'package:app_bluestorm/services/auth_service.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class Medications extends GetxController {
  AuthService authService = AuthService();
  Dio dio = Dio();

  @override
  void onReady() {
    super.onReady();
    getAllMedications();
  }

  Items items;
  int page;
  int total;

  Medications({this.items, this.page, this.total});

  List listMedications = [];

  factory Medications.fromJson(Map<String, dynamic> json) => Medications(
        items: Items.fromMap(json['items'] as Map<String, dynamic>),
        page: json["page"],
        total: json["total"],
      );

  Future<void> getAllMedications() async {
    try {
      String token = Singleton.instance.tokenData;

      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["Authorization"] = "Bearer $token";

      final response = await dio.get(
          'https://djbnrrib9e.execute-api.us-east-2.amazonaws.com/v1/medications');
      print(response.data);

      listMedications =
          (response.data as List).map((e) => Medications.fromJson(e)).toList();
    } on DioError catch (e) {
      print(e.message);
    }
  }
}
