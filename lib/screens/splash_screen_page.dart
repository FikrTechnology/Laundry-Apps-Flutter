part of 'pages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  _navigateToLogin() async {
    WidgetsFlutterBinding.ensureInitialized();
    var token = await UserInfo().getToken();
    await Future.delayed(const Duration(seconds: 3), () {
      // Check if the widget is still mounted before using the context
      if (mounted) {
        if (token == null) {
          Navigator.pushReplacementNamed(context, AppRoutes.login);
        }else{
          Navigator.pushReplacementNamed(context, AppRoutes.home);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: const Color(0xFFB7E0FF),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/image/logo_splash.svg',
              width: 300,
              height: 300,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'CleanSwift',
              style: TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 36,
                  fontWeight: FontWeight.w700),
            ),
            const Text('Fast & Fresh Laundry at Your Fingertips',
                style: TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 16,
                )),
          ],
        ),
      ),
    );
  }
}
