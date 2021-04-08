import 'package:app_bluestorm/controller/favorites_controller.dart';
import 'package:app_bluestorm/pages/drawer/custom_drawer.dart';
import 'package:app_bluestorm/widgets/list_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
  final FavoritesController favorites = Get.put(FavoritesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Favoritos'),
          centerTitle: true,
        ),
        drawer: CustomDrawer(),
        body: Obx(() {
          if (favorites.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else
            return ListView.builder(
                itemCount: favorites.listFavorites.length,
                itemBuilder: (_, index) {
                  return ListDetailWidget(favorites.listMedications[index]);
                });
        }));
  }
}
