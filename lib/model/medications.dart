import 'package:get/get.dart';

class Medications extends GetxController {
  List<String> items;
  int page;
  int total;

  Medications({this.items, this.page, this.total});

  factory Medications.fromJson(Map<String, dynamic> json) => Medications(
        items: json["items"],
        page: json["page"],
        total: json["total"],
      );
}
