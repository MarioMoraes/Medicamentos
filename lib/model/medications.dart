import 'package:app_bluestorm/model/items.dart';
import 'package:app_bluestorm/services/auth_service.dart';
import 'package:get/get.dart';

class Medications extends GetxController {
  AuthService authService = AuthService();

  @override
  void onReady() {
    super.onReady();
    authService.getAllMedications();
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
}
