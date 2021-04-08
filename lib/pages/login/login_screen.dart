import 'package:app_bluestorm/helpers/validators.dart';
import 'package:app_bluestorm/model/user_model.dart';
import 'package:app_bluestorm/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();

  final AuthService auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final AuthService auth = Get.put(AuthService());

    return Scaffold(
        key: scaffoldState,
        appBar: AppBar(
          title: Text('Login'),
          centerTitle: true,
        ),
        body: Center(
            child: Card(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: GetBuilder<UserModel>(
            init: UserModel(),
            builder: (_) {
              return Form(
                key: formState,
                child: ListView(
                  padding: EdgeInsets.all(16),
                  shrinkWrap: true,
                  children: <Widget>[
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
                      child: Obx(
                        () => ElevatedButton(
                            onPressed: () async {
                              if (formState.currentState.validate()) {
                                formState.currentState.save();
                                auth.getAuth(
                                  user: _,
                                  onSuccess: () {
                                    Get.offNamed('/');
                                  },
                                  onFail: (e) {
                                    scaffoldState.currentState
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                          'Usuário/Senha Inválidos. Tente Novamente...'),
                                      backgroundColor: Colors.red,
                                    ));
                                  },
                                );
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
                            child: (auth.isLoading.value)
                                ? CircularProgressIndicator(
                                    valueColor:
                                        new AlwaysStoppedAnimation<Color>(
                                            Colors.white),
                                  )
                                : Text('Entrar',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ))),
                      ),
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
