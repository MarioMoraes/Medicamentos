import 'package:app_bluestorm/helpers/favorites.dart';
import 'package:app_bluestorm/helpers/singleton.dart';
import 'package:app_bluestorm/model/medications_model.dart';
import 'package:app_bluestorm/services/auth_service.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class FavoritesController extends GetxController {
  String query = "";

  int limit = 20;
  String token;

  var listMedications = [].obs;
  var listFavorites = [].obs;

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
      token = Singleton.instance.tokenData;

      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["Authorization"] = "Bearer $token";

      dio.options.queryParameters = {'page': pg.value, 'limit': limit};

      final response = await dio.get(
          'https://djbnrrib9e.execute-api.us-east-2.amazonaws.com/v1/medications');

      pg.value = response.data['page'];

      listMedications.value = (response.data['items'])
          .map<Item>((item) => Item.fromJson(item))
          .toList();

      Favorites favorites = Favorites();
      listFavorites.value = await favorites.getFavorites();

      print('STOP');
    } on DioError catch (e) {
      print(e.message);
    }
    isLoading(false);
  }

  filterFavorites() {
    List<Item> listDiferente = [];

    for (int i = 0; i < listMedications.length; i++) {
      var aux = listMedications[i];

      for (int j = 0; j < listFavorites.length; j++) {
        var aux2 = listFavorites[j];
        if (aux == aux2) {
          listDiferente.add(aux);
        }
      }
    }
    print(listDiferente.toString());
  }
}
