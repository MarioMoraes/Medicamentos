import 'package:app_bluestorm/helpers/favorites.dart';
import 'package:app_bluestorm/helpers/singleton.dart';
import 'package:app_bluestorm/model/medications_model.dart';
import 'package:app_bluestorm/services/auth_service.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class FavoritesController extends GetxController {
  String query = "";

  int limit = 20;
  String _token;

  List<Item> itemList = [];

  var listFavorites = [].obs;
  var listDiferente = [].obs;
  var isLoading = true.obs;
  RxInt pg = 1.obs;

  AuthService authService = AuthService();
  Dio dio = Dio();

  @override
  void onInit() {
    getAllFavorites();
    super.onInit();
  }

  Future<void> getAllFavorites() async {
    try {
      isLoading(true);
      _token = Singleton.instance.tokenData;

      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["Authorization"] = "Bearer $_token";

      dio.options.queryParameters = {'page': pg.value, 'limit': limit};

      final response = await dio.get(
          'https://djbnrrib9e.execute-api.us-east-2.amazonaws.com/v1/medications');

      pg.value = response.data['page'];

      itemList = (response.data['items'])
          .map<Item>((item) => Item.fromJson(item))
          .toList();

      Favorites favorites = Favorites();
      listFavorites.value = await favorites.getFavorites();

      filterFavorites();

      update();
    } on DioError catch (e) {
      print(e.message);
    }
    isLoading(false);
  }

  filterFavorites() {
    for (int i = 0; i < itemList.length; i++) {
      var aux = itemList[i].medicationId;

      for (int j = 0; j < listFavorites.length; j++) {
        var aux2 = listFavorites[j];

        if (aux == aux2) {
          listDiferente.add(itemList[i]);
        }
      }
    }
  }

  @override
  void onClose() {
    // chamado pouco antes do controlador ser excluído da memória
    super.onClose();
  }
}
