class User {
  String username;
  String password;

  User({this.username, this.password});

  factory User.fromJson(Map<String, dynamic> json) => User(
        username: json["greeting"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "passowrd": password,
      };
}
