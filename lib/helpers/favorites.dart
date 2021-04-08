import 'package:shared_preferences/shared_preferences.dart';

class Favorites {
  SharedPreferences prefs;
  List<String> items = [];

  Future<void> setFavorites() async {
    prefs.setStringList('favorites', items);
  }

  Future<List<String>> getFavorites() async {
    var prefs = await SharedPreferences.getInstance();
    items = prefs.getStringList('favorites');
    return items;
  }

  addFavorite(String item) async {
    var prefs = await SharedPreferences.getInstance();
    items = prefs.getStringList('favorites');

    items.add(item);
    prefs.setStringList('favorites', items);
  }

  removeFavorite(String item) async {
    var prefs = await SharedPreferences.getInstance();
    items.remove(item);
    prefs.setStringList('favorites', items);
  }
}
