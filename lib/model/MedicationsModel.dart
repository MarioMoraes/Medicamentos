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
        items: List<Item>.from(json["items"].map((x) => Item.fromMap(x))),
        page: json["page"],
        total: json["total"],
      );

  factory MedicationsModel.fromMap(Map<String, dynamic> json) =>
      MedicationsModel(
        items: List<Item>.from(json["items"].map((x) => Item.fromMap(x))),
        page: json["page"],
        total: json["total"],
      );

  Map<String, dynamic> toMap() => {
        "items": List<dynamic>.from(items.map((x) => x.toMap())),
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

  Item copyWith({
    String medicationId,
    String form,
    String strength,
    String referenceDrug,
    String drugName,
    String activeIngredient,
    String referenceStandard,
  }) =>
      Item(
        medicationId: medicationId ?? this.medicationId,
        form: form ?? this.form,
        strength: strength ?? this.strength,
        referenceDrug: referenceDrug ?? this.referenceDrug,
        drugName: drugName ?? this.drugName,
        activeIngredient: activeIngredient ?? this.activeIngredient,
        referenceStandard: referenceStandard ?? this.referenceStandard,
      );

  factory Item.fromMap(Map<String, dynamic> json) => Item(
        medicationId: json["medication_id"],
        form: json["form"],
        strength: json["strength"],
        referenceDrug: json["reference_drug"],
        drugName: json["drug_name"],
        activeIngredient: json["active_ingredient"],
        referenceStandard: json["reference_standard"],
      );

  Map<String, dynamic> toMap() => {
        "medication_id": medicationId,
        "form": form,
        "strength": strength,
        "reference_drug": referenceDrug,
        "drug_name": drugName,
        "active_ingredient": activeIngredient,
        "reference_standard": referenceStandard,
      };
}
