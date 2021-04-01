import 'package:get/get.dart';

class User extends GetxController {
  String username = "";
  String password = "";

  User({this.username, this.password});

  factory User.fromJson(Map<String, dynamic> json) => User(
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toMap() => {
        "username": username,
        "password": password,
      };
}
