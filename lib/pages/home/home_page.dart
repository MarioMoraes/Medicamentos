import 'package:app_bluestorm/pages/login/login_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medicamentos'),
        centerTitle: true,
      ),
      body: LoginScreen(),
    );
  }
}
