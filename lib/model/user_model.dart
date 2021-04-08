import 'package:get/get.dart';

class UserModel extends GetxController {
  String username = "";
  String password = "";

  UserModel({this.username, this.password});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toMap() => {
        "username": username,
        "password": password,
      };
}
