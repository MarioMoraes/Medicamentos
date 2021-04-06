import 'package:app_bluestorm/model/MedicationsModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardDetailWidget extends StatelessWidget {
  final Item detail;

  CardDetailWidget(this.detail);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          Get.toNamed('/detail', arguments: detail);
        },
        child: Container(
          height: 100,
          child: Card(
            color: Colors.grey[100],
            elevation: 8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        detail.drugName,
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: FlatButton(
                            onPressed: () {},
                            child: Icon(Icons.favorite_border)),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    detail.activeIngredient,
                    style: TextStyle(color: Colors.black87, fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
