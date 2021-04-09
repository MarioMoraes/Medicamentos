import 'package:app_bluestorm/controller/medications_controller.dart';
import 'package:app_bluestorm/helpers/favorites.dart';
import 'package:app_bluestorm/model/medications_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';

class MedicationDetailWidget extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();
  final Item item;
  final MedicationsController medicationsController =
      Get.put(MedicationsController());

  MedicationDetailWidget(this.item);

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = TextStyle(
        fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white);
    TextStyle nameStyle = TextStyle(
        fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87);

    return Scaffold(
      key: scaffoldState,
      appBar: AppBar(
        title: Text(
          'Informações',
        ),
        centerTitle: true,
        actions: [
          LikeButton(
            onTap: onLikeButtonTapped,
            size: 30,
            circleColor:
                CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
            bubblesColor: BubblesColor(
              dotPrimaryColor: Color(0xff33b5e5),
              dotSecondaryColor: Color(0xff0099cc),
            ),
            likeBuilder: (bool isLiked) {
              return Icon(
                Icons.favorite,
                color: isLiked ? Colors.red : Colors.grey,
                size: 30,
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            Text('Id', style: titleStyle),
            Text(item.medicationId, style: nameStyle),
            SizedBox(height: 15),
            Text('Medicamento', style: titleStyle),
            Text(item.drugName, style: nameStyle),
            SizedBox(height: 15),
            Text('Referência', style: titleStyle),
            Text(item.referenceDrug, style: nameStyle),
            SizedBox(height: 15),
            Text('Capacidade', style: titleStyle),
            Text(item.strength, style: nameStyle),
            SizedBox(height: 15),
            Text('Ingredientes Ativos', style: titleStyle),
            Text(item.activeIngredient, style: nameStyle),
            SizedBox(height: 15),
            Text('Formato', style: titleStyle),
            Text(item.form, style: nameStyle),
            SizedBox(height: 15),
            Text('Formato', style: titleStyle),
            Text(item.referenceStandard, style: nameStyle),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Future<bool> onLikeButtonTapped(bool isLiked) async {
    Favorites favorite = Favorites();
    favorite.addFavorite(item);

    scaffoldState.currentState.showSnackBar(SnackBar(
      duration: Duration(seconds: 2),
      content: Text('Adicionado aos Favoritos'),
      backgroundColor: Colors.red,
    ));

    return !isLiked;
  }
}

/*
            Expanded(
              flex: 1,
              child: ElevatedButton(
                  onPressed: () async {
                    Favorites favorite = Favorites();
                    favorite.addFavorite(item);

                    scaffoldState.currentState.showSnackBar(SnackBar(
                      duration: Duration(seconds: 2),
                      content: Text('Adicionado aos Favoritos'),
                      backgroundColor: Colors.red,
                    ));
                  },
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(5),
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        return Theme.of(context).accentColor;
                      },
                    ),
                  ),
                  child: Text('Adicionar aos Favoritos',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ))),
            )
*/
