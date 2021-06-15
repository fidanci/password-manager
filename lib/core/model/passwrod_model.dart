class PasswordModel {
  int? id;
  String? userName;
  String? passURL;
  String? password;

  PasswordModel({
    this.id,
    required this.userName,
    required this.passURL,
    required this.password,
  });

  PasswordModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    passURL = json['passURL'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['passURL'] = this.passURL;
    data['password'] = this.password;
    return data;
  }
}
