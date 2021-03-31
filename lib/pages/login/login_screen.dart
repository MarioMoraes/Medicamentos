import 'package:app_timao/helpers/validators.dart';
import 'package:app_timao/manager/user_manager.dart';
import 'package:app_timao/models/user.dart';
import 'package:app_timao/screens/drawer/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

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
            child: Form(
              key: formState,
              child: Consumer<UserManager>(builder: (_, userManager, child) {
                return ListView(
                  padding: EdgeInsets.all(16),
                  shrinkWrap: true,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/icone.png',
                      height: 50,
                      width: 50,
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      enabled: !userManager.loading,
                      controller: emailController,
                      decoration: InputDecoration(hintText: 'Email'),
                      onTap: () {},
                      validator: (email) {
                        if (!validEmail(email))
                          return 'Email Inválido !!!!';
                        else
                          return null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      enabled: !userManager.loading,
                      controller: senhaController,
                      decoration: InputDecoration(hintText: 'Senha'),
                      obscureText: true,
                      onTap: () {},
                      validator: (senha) {
                        if (validSenha(senha))
                          return 'Senha Inválida !!!!';
                        else
                          return null;
                      },
                    ),
                    SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {},
                        child: Text(
                          'Esqueceu Sua Senha? ',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                          onPressed: userManager.loading
                              ? null
                              : () {
                                  if (formState.currentState.validate()) {
                                    userManager.signIn(
                                        user: User(
                                            email: emailController.text,
                                            senha: senhaController.text),
                                        onFail: (e) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text('Fail !!!!! $e'),
                                            backgroundColor: Colors.red,
                                          ));
                                        },
                                        onSuccess: () {
                                          Navigator.pushReplacementNamed(
                                            context,
                                            '/',
                                          );
                                        });
                                  }
                                },
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(5),
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                return userManager.loading
                                    ? Theme.of(context)
                                        .accentColor
                                        .withAlpha(100)
                                    : Theme.of(context).accentColor;
                              },
                            ),
                          ),
                          child: userManager.loading
                              ? CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.white))
                              : Text('Entrar',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ))),
                    ),
                    SizedBox(height: 8),
                    SizedBox(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Não Tem Cadastro?',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500)),
                            SizedBox(width: 8),
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushReplacementNamed('/signup');
                              },
                              child: Text('CRIAR CONTA',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        )),
                  ],
                );
              }),
            ),
          ),
        ));
  }
}
