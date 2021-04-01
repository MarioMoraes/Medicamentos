import 'package:app_bluestorm/model/items.dart';
import 'package:get/get.dart';

class Medications extends GetxController {
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
}
