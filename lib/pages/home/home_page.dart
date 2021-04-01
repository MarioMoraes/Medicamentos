import 'package:app_bluestorm/model/medications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Medicamentos'),
          centerTitle: true,
        ),
        body: GetBuilder<Medications>(
          init: Medications(),
          builder: (controller) {
            return ListView.builder(itemBuilder: (_, index) {
              return ListTile(
                title: Text(controller.items.toString()),
              );
            });
          },
        ));
  }
}
