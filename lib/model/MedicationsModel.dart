import 'dart:convert';

List<MedicationsModel> medicationsFromJson(String str) =>
    List<MedicationsModel>.from(
        json.decode(str).map((x) => MedicationsModel.fromJson(x)));

String medicationsToJson(List<MedicationsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MedicationsModel {
  MedicationsModel({
    this.items,
    this.page,
    this.total,
  });

  List<Item> items;
  int page;
  int total;

  factory MedicationsModel.fromJson(Map<String, dynamic> json) =>
      MedicationsModel(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        page: json["page"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "page": page,
        "total": total,
      };
}

class Item {
  Item({
    this.medicationId,
    this.form,
    this.strength,
    this.referenceDrug,
    this.drugName,
    this.activeIngredient,
    this.referenceStandard,
  });

  String medicationId;
  String form;
  String strength;
  String referenceDrug;
  String drugName;
  String activeIngredient;
  String referenceStandard;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        medicationId: json["medication_id"],
        form: json["form"],
        strength: json["strength"],
        referenceDrug: json["reference_drug"],
        drugName: json["drug_name"],
        activeIngredient: json["active_ingredient"],
        referenceStandard: json["reference_standard"],
      );

  Map<String, dynamic> toJson() => {
        "medication_id": medicationId,
        "form": form,
        "strength": strength,
        "reference_drug": referenceDrug,
        "drug_name": drugName,
        "active_ingredient": activeIngredient,
        "reference_standard": referenceStandard,
      };
}
