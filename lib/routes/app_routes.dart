part of '../screens/pages.dart';

class AppRoutes {
  // Define route names as constants
  static const String splash = '/';
  static const String login = '/login';
  static const String home = '/home';

  // Function that returns a Map<String, WidgetBuilder>
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      splash: (context) => const SplashScreen(),
      login: (context) => const LoginPage(),
      home: (context) => const HomePage(),
    };
  }
}
