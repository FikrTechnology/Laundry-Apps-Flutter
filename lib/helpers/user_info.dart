// import 'package:shared_preferences/shared_preferences.dart';

// const String TOKEN = "token";
// const String USER_ID = "user_id";
// const String USERNAME = "username";

// class UserInfo {
//   Future setToken(String value) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.setString(TOKEN, value);
//   }

//   Future<String?> getToken() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getString(TOKEN);
//   }

//   Future setUserId(String value) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.setString(USER_ID, value);
//   } 

//   Future<String?> getUserId() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getString(USER_ID).toString();
//   }

//   Future setUsername(String value) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.setString(USERNAME, value);
//   }

//   Future<String?> getUsername() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getString(USERNAME).toString();
//   }
// }
