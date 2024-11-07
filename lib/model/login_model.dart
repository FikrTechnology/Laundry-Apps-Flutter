class LoginModel {
  String? username;
  String? password;

  LoginModel({this.username, this.password});

  // Validasi sederhana
  bool validate() {
    return username != null && username!.isNotEmpty &&
           password != null && password!.isNotEmpty;
  }
}