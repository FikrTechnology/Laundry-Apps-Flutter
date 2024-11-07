import 'package:flutter/material.dart';
import 'package:laundry_apps/model/login_model.dart';
import 'package:laundry_apps/service/login_auth.dart';

class LoginViewModel extends ChangeNotifier {
  final LoginAuth _authService = LoginAuth();
  LoginModel loginModel = LoginModel();
  bool isLoading = false;
  String? errorMessage;

  // Fungsi login
  Future<void> login() async {
    // Cek validasi
    if (!loginModel.validate()) {
      errorMessage = "Username dan password harus diisi!";
      notifyListeners();
      return;
    }

    // Mulai loading
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    // Proses login
    bool success = await _authService.login(loginModel.username!, loginModel.password!);

    // Update loading dan hasil
    isLoading = false;
    if (!success) {
      errorMessage = "Username atau password salah.";
    }
    notifyListeners();
  }

  // Method untuk mengupdate username dan password
  void updateUsername(String username) {
    loginModel.username = username;
    notifyListeners();
  }

  void updatePassword(String password) {
    loginModel.password = password;
    notifyListeners();
  }
}
