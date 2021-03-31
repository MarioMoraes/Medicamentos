import 'package:app_bluestorm/pages/home/home_page.dart';
import 'package:app_bluestorm/pages/login/login_screen.dart';
import 'package:app_bluestorm/services/auth_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _authService = AuthService();

  @override
  void initState() {
    super.initState();
    _authService.showLogin();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Medicamentos',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 100, 181, 246),
        scaffoldBackgroundColor: const Color.fromARGB(255, 100, 181, 246),
        accentColor: const Color.fromARGB(255, 13, 71, 161),
        fontFamily: 'Roboto',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StreamBuilder<AuthState>(
          stream: _authService.authStateController.stream,
          builder: (context, snapshot) {
            if (snapshot.data.authFlowStatus == AuthFlowStatus.login)
              return LoginScreen();
            else
              return HomePage();
          }),
    );
  }
}
