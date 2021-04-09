import 'package:app_bluestorm/controller/medications_controller.dart';
import 'package:app_bluestorm/view/drawer/custom_drawer.dart';
import 'package:app_bluestorm/widgets/list_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final MedicationsController medications = Get.put(MedicationsController());

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
            return Padding(
              padding: EdgeInsets.only(top: 4),
              child: ListView.separated(
                  itemCount: medications.listMedications.length,
                  itemBuilder: (_, index) {
                    return ListDetailWidget(medications.listMedications[index]);
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.transparent,
                      height: 5,
                    );
                  }),
            );
        }));
  }
}
