import 'package:app_bluestorm/helpers/favorites.dart';
import 'package:app_bluestorm/model/medications_model.dart';
import 'package:flutter/material.dart';

class MedicationDetailWidget extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();
  final Item item;

  MedicationDetailWidget(this.item);

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.cyan[900],
        fontFamily: 'Avenir');
    TextStyle nameStyle = TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
        fontFamily: 'Avenir');

    return Scaffold(
      key: scaffoldState,
      appBar: AppBar(
        title: Text(
          'Informações',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Card(
          shadowColor: Colors.blueGrey[200],
          borderOnForeground: true,
          margin: EdgeInsets.all(12),
          child: ListView(
            padding: EdgeInsets.all(12),
            children: [
              Text('Id', style: titleStyle),
              Text(item.medicationId, style: nameStyle),
              SizedBox(height: 25),
              Text('Medicamento', style: titleStyle),
              Text(item.drugName, style: nameStyle),
              SizedBox(height: 25),
              Text('Referência', style: titleStyle),
              Text(item.referenceDrug, style: nameStyle),
              SizedBox(height: 25),
              Text('Capacidade', style: titleStyle),
              Text(item.strength, style: nameStyle),
              SizedBox(height: 25),
              Text('Ingredientes Ativos', style: titleStyle),
              Text(item.activeIngredient, style: nameStyle),
              SizedBox(height: 25),
              Text('Formato', style: titleStyle),
              Text(item.form, style: nameStyle),
              SizedBox(height: 25),
              Text('Formato', style: titleStyle),
              Text(item.referenceStandard, style: nameStyle),
              SizedBox(height: 30),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: FlatButton.icon(
                      onPressed: () => addFavorite(),
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      label: Text('Favorito',
                          style: TextStyle(color: Colors.red))))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addFavorite() async {
    Favorites favorite = Favorites();
    favorite.addFavorite(item);

    scaffoldState.currentState.showSnackBar(SnackBar(
      duration: Duration(seconds: 2),
      content: Text('Adicionado aos Favoritos'),
      backgroundColor: Colors.red,
    ));
  }
}
