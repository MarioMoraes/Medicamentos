import 'package:app_bluestorm/view/favorite/favorite_screen.dart';
import 'package:app_bluestorm/view/home/home_page.dart';
import 'package:app_bluestorm/view/login/login_screen.dart';
import 'package:app_bluestorm/widgets/medication_detail_widget.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Medicamentos',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 100, 181, 246),
        scaffoldBackgroundColor: const Color.fromARGB(255, 100, 181, 246),
        accentColor: const Color.fromARGB(255, 13, 71, 161),
        fontFamily: 'Roboto',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/', page: () => HomePage()),
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/detail', page: () => MedicationDetailWidget(null)),
        GetPage(name: '/favorite', page: () => FavoriteScreen()),
      ],
    );
  }
}
