import 'package:app_bluestorm/model/MedicationsModel.dart';
import 'package:flutter/material.dart';

class MedicationDetailWidget extends StatelessWidget {
  final Item item;

  MedicationDetailWidget(this.item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informações'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            Text(item.drugName),
            Text(item.medicationId),
            Text(item.referenceDrug),
            Text(item.strength),
            Text(item.activeIngredient),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {},
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(5),
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      return Theme.of(context).accentColor;
                    },
                  ),
                ),
                child: Text('Favorito',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    )))
          ],
        ),
      ),
    );
  }
}
