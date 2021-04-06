import 'package:app_bluestorm/model/MedicationsModel.dart';
import 'package:flutter/material.dart';

class MedicationDetailWidget extends StatelessWidget {
  final Item detail;

  MedicationDetailWidget(this.detail);

  @override
  Widget build(BuildContext context) {
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
