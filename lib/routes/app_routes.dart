part of '../screens/pages.dart';

class AppRoutes {
  // Define route names as constants
  static const String splash = '/';
  static const String login = '/login';
  static const String home = '/home';
  static const String onProgress = '/onProgress';
  static const String doneProgress = '/doneProgress';
  static const String customerDetail = '/customerDetail';
  static const String customerDetailOnDone = '/customerDetailOnDone';
  static const String updateCustomer = '/updateCustomer';

  // Function that returns a Map<String, WidgetBuilder>
  // static Map<String, WidgetBuilder> getRoutes() {
  //   return {
  //     splash: (context) => const SplashScreen(),
  //     login: (context) => const LoginPage(),
  //     home: (context) => const HomePage(),
  //     onProgress: (context) => const ProgressListPage(),
  //     doneProgress: (context) => const DoneListPage(),
  //     customerDetail: (context) => const CustomerDetailPage(args: {},),
  //     updateCustomer: (context) => const UpdateCustomerPage(),
  //   };
  // }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case onProgress:
        return MaterialPageRoute(builder: (_) => const ProgressListPage());
      case doneProgress:
        return MaterialPageRoute(builder: (_) => const DoneListPage());
      case customerDetail:
        final customerDetailOnProgress = settings.arguments as Onprogress;
        return MaterialPageRoute(
          builder: (_) => CustomerDetailPage(
            customerDetailOnProgress: customerDetailOnProgress,
          ),
        );
      case updateCustomer:
        return MaterialPageRoute(builder: (_) => const UpdateCustomerPage());
      case customerDetailOnDone:
        final customerDetailOnDone = settings.arguments as Ondone;
        return MaterialPageRoute(
          builder: (_) => CustomerDetailOnDonePage(
            customerDetailOnDone: customerDetailOnDone,
          ),
        );
      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
