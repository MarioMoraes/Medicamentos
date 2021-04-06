import 'package:app_bluestorm/model/medications.dart';
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
        body: Obx(() {
          if (medications.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else
            return ListView.builder(
                itemCount: medications.listMedications.length,
                itemBuilder: (_, index) {
                  return ListTile(
                    title: Text(medications.listMedications[index].drugName),
                  );
                });
        }));
  }
}
