import 'package:app_bluestorm/helpers/validators.dart';
import 'package:app_bluestorm/model/user.dart';
import 'package:app_bluestorm/pages/drawer/custom_drawer.dart';
import 'package:app_bluestorm/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldState,
        appBar: AppBar(
          title: Text('Login'),
          centerTitle: true,
        ),
        drawer: CustomDrawer(),
        body: Center(
            child: Card(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: GetBuilder<User>(
            init: User(),
            builder: (_) {
              return Form(
                key: formState,
                child: ListView(
                  padding: EdgeInsets.all(16),
                  shrinkWrap: true,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/icone.png',
                      height: 60,
                      width: 60,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                        onSaved: (name) => _.username = name,
                        decoration: InputDecoration(hintText: 'Usuário'),
                        onTap: () {},
                        validator: (user) {
                          if (!userIsValid(user))
                            return "Usuário Inválido!";
                          else
                            return null;
                        }),
                    SizedBox(height: 16),
                    TextFormField(
                      onSaved: (pass) => _.password = pass,
                      decoration: InputDecoration(hintText: 'Senha'),
                      obscureText: true,
                      onTap: () {},
                      validator: (pass) {
                        if (!userIsValid(pass))
                          return "Usuário Inválido!";
                        else
                          return null;
                      },
                    ),
                    SizedBox(height: 40),
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () async {
                            if (formState.currentState.validate()) {
                              formState.currentState.save();
                              AuthService auth = AuthService();
                              await auth.getAuth(_);
                            }
                          },
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(5),
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                return Theme.of(context).accentColor;
                              },
                            ),
                          ),
                          child: Text('Entrar',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ))),
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              );
            },
          ),
        )));
  }
}
