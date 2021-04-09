import 'package:app_bluestorm/controller/favorites_controller.dart';
import 'package:app_bluestorm/view/drawer/custom_drawer.dart';
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
            return ListView.separated(
                itemCount: favorites.listDiferente.length,
                itemBuilder: (_, index) {
                  return ListDetailWidget(favorites.listDiferente[index]);
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Colors.transparent,
                    height: 5,
                  );
                });
        }));
  }
}
