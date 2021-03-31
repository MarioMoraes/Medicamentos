import 'package:app_timao/manager/user_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      child: Consumer<UserManager>(builder: (_, userManager, __) {
        return Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            DrawerHeader(
              child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    "assets/images/icone.png",
                    height: 60,
                    width: 60,
                  )),
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
            ),
            Text(userManager.logged ? userManager.user.email : '',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                )),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = 3;
                });
                Navigator.of(context).pop();
              },
              child: Text(
                'Home',
                style: TextStyle(
                  fontFamily: 'Avenir',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 45,
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                'Produtos',
                style: TextStyle(
                  fontFamily: 'Avenir',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 45,
            ),
            Text(
              'Pedidos',
              style: TextStyle(
                fontFamily: 'Avenir',
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 45,
            ),
            Text(
              'Lojas',
              style: TextStyle(
                fontFamily: 'Avenir',
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 45,
            ),
            InkWell(
              onTap: () {
                if (userManager.logged)
                  userManager.logOut();
                else
                  Navigator.pushNamed(context, '/login');
              },
              child: Text(
                userManager.logged ? 'Logout' : 'Login',
                style: TextStyle(
                  fontFamily: 'Avenir',
                  fontSize: 20,
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
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ))
          ],
        );
      }),
    );
  }
}
