import 'dart:async';

class LoginAuth {
  Future<bool> login(String email, String password) async {
    if (email == "admin" && password == "admin") {
      return true;
    }else{
      return false;
    }
  }
}