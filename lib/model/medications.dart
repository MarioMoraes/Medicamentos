import 'package:app_bluestorm/helpers/singleton.dart';
import 'package:app_bluestorm/model/items.dart';
import 'package:app_bluestorm/services/auth_service.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Medications extends GetxController {
  String query = "";
  int pg = 1;
  int limit = 20;
  String token;

  AuthService authService = AuthService();
  Dio dio = Dio();

  @override
  void onInit() {
    super.onInit();
    getAllFake();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Items items;
  int page;
  int total;

  Medications({this.items, this.page, this.total});

  List<Medications> listMedications = [];

  factory Medications.fromJson(Map<String, dynamic> json) => Medications(
        items: Items.fromMap(json['items'] as Map<String, dynamic>),
        page: json["page"],
        total: json["total"],
      );

  getAllFake() {
    listMedications =
        "[{page:1,total:20,items:[{'medication_id': 'medication2','form': 'form2','strength': 'strenght2','reference_drug': 'drug2','drug_name': 'drugname2','active_ingredient': 'active2','reference_standard': 'reference2'},{'medication_id': 'medication1','form': 'form1','strength': 'strenght1','reference_drug': 'drug1','drug_name': 'drugname1','active_ingredient': 'active1','reference_standard': 'reference1'},{'medication_id': 'medication3','form': 'form3','strength': 'strenght3','reference_drug': 'drug3','drug_name': 'drugname3','active_ingredient': 'active3','reference_standard': 'reference3'},],},{page:2,total:25,items:[{'medication_id': 'medication5','form': 'form5','strength': 'strenght5','reference_drug': 'drug5','drug_name': 'drugname5','active_ingredient': 'active5','reference_standard': 'reference5'},{'medication_id': 'medication6','form': 'form6','strength': 'strenght6','reference_drug': 'drug6','drug_name': 'drugname6','active_ingredient': 'active6','reference_standard': 'reference6'},{'medication_id': 'medication7','form': 'form7','strength': 'strenght7','reference_drug': 'drug7','drug_name': 'drugname7','active_ingredient': 'active7','reference_standard': 'reference7'}]}]"
            as List<Medications>;
    print(listMedications);
  }

  Future<void> getAllMedications() async {
    try {
      token = Singleton.instance.tokenData;

      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["Authorization"] = "Bearer $token";

      dio.options.queryParameters = {
        'query': 'eritro',
        'page': pg,
        'limit': limit
      };

      final response = await dio.get(
          'https://djbnrrib9e.execute-api.us-east-2.amazonaws.com/v1/medications');
      print(response.data);

      listMedications =
          (response.data as List).map((e) => Medications.fromJson(e)).toList();
    } on DioError catch (e) {
      print(e.message);
    }
  }

  void getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
  }
}
