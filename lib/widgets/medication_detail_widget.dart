import 'package:app_bluestorm/model/MedicationsModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MedicationDetailWidget extends StatelessWidget {
  MedicationDetailWidget();

  @override
  Widget build(BuildContext context) {
    final detail = Get.parameters['detail'] as Item;

    return Scaffold(
      appBar: AppBar(
        title: Text('Informações'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Card(
          child: Column(
            children: [
              Text(detail.drugName),
              Text(detail.medicationId),
              Text(detail.referenceDrug),
              Text(detail.strength),
              Text(detail.activeIngredient)
            ],
          ),
        ),
      ),
    );
  }
}
