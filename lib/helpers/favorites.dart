import 'package:app_bluestorm/model/medications_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Favorites {
  SharedPreferences prefs;
  List<String> items = [];

  Future<void> setFavorites() async {
    prefs.setStringList('favorites', items);
  }

  Future<List<String>> getFavorites() async {
    var prefs = await SharedPreferences.getInstance();
    items = prefs.getStringList('favorites') ?? [];
    return items;
  }

  addFavorite(Item item) async {
    var prefs = await SharedPreferences.getInstance();
    items = prefs.getStringList('favorites') ?? [];

    // Verifica se Item Ja foi Adicionado
    List result = items.where((x) => x.contains(item.medicationId)).toList();

    if (result.isEmpty) items.add(item.medicationId);

    prefs.setStringList('favorites', items);
  }

  removeFavorite(String item) async {
    var prefs = await SharedPreferences.getInstance();
    items.remove(item);
    prefs.setStringList('favorites', items);
  }
}
