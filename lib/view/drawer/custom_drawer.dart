import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  int currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        elevation: 5,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            DrawerHeader(
              child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'assets/images/icone.png',
                    height: 30,
                    width: 30,
                  )),
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = 3;
                });
                Get.offNamed('/');
              },
              child: Text(
                'Home',
                style: TextStyle(
                  fontFamily: 'Avenir',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 45,
            ),
            GestureDetector(
              onTap: () {
                Get.offNamed('/favorite');
              },
              child: Text(
                'Favoritos',
                style: TextStyle(
                  fontFamily: 'Avenir',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 45,
            ),
            InkWell(
              onTap: () {
                Get.offNamed('/login');
              },
              child: Text(
                'Logout',
                style: TextStyle(
                  fontFamily: 'Avenir',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 45,
            ),
            Expanded(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 65,
                width: MediaQuery.of(context).size.width,
                color: Theme.of(context).primaryColor.withAlpha(200),
                child: Center(
                  child: Text(
                    'v1.0',
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: 14,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ))
          ],
        ));
  }
}
