part of '../screens/pages.dart';

class AppRoutes {
  // Define route names as constants
  static const String splash = '/';
  static const String login = '/login';
  static const String home = '/home';
  static const String onProgress = '/onProgress';
  static const String doneProgress = '/doneProgress';
  static const String customerDetail = '/customerDetail';
  static const String updateCustomer = '/updateCustomer';

  // Function that returns a Map<String, WidgetBuilder>
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      splash: (context) => const SplashScreen(),
      login: (context) => const LoginPage(),
      home: (context) => const HomePage(),
      onProgress: (context) => const ProgressListPage(),
      doneProgress: (context) => const DoneListPage(),
      customerDetail: (context) => const CustomerDetailPage(),
      updateCustomer: (context) => const UpdateCustomerPage(),
    };
  }
}
