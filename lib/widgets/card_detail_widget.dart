import 'package:app_bluestorm/model/MedicationsModel.dart';
import 'package:app_bluestorm/widgets/medication_detail_widget.dart';
import 'package:flutter/material.dart';

class CardDetailWidget extends StatelessWidget {
  final Item item;

  CardDetailWidget(this.item);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      title: Text(
        item.drugName,
        style: TextStyle(fontSize: 14),
      ),
      subtitle: Text(
        item.activeIngredient,
        style: TextStyle(fontSize: 12),
      ),
      leading: Image.asset(
        'assets/images/icone.png',
        height: 40,
        width: 40,
      ),
      trailing: IconButton(
        icon: Icon(Icons.favorite_border, color: Colors.red),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => MedicationDetailWidget(item)));
        },
      ),
    );
  }
}
