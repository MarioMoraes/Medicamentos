import 'package:app_bluestorm/model/medications.dart';
import 'package:app_bluestorm/pages/drawer/custom_drawer.dart';
import 'package:app_bluestorm/widgets/card_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final Medications medications = Get.put(Medications());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Medicamentos'),
          centerTitle: true,
        ),
        drawer: CustomDrawer(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.navigate_next),
          onPressed: () {
            medications.nextPage();
          },
        ),
        body: Obx(() {
          if (medications.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else
            return ListView.separated(
                itemCount: medications.listMedications.length,
                itemBuilder: (_, index) {
                  return CardDetailWidget(medications.listMedications[index]);
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
