import 'package:app_bluestorm/pages/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialRoute: '/login',
        debugShowCheckedModeBanner: false,
        title: 'Medicamentos',
        theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 100, 181, 246),
          scaffoldBackgroundColor: const Color.fromARGB(255, 100, 181, 246),
          accentColor: const Color.fromARGB(255, 13, 71, 161),
          fontFamily: 'Roboto',
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoginScreen());
  }
}
