part of 'pages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/image/logo_login.svg',
                  height: 200,
                  width: 300,
                ),
                const SizedBox(
                  height: 50,
                ),
                const TextFieldLeading(
                  label: 'Username',
                  hintText: 'Masukan Username',
                  icon: Icons.email_outlined,
                ),
                const SizedBox(
                  height: 24,
                ),
                const TextFieldLeading(
                  label: 'Password',
                  hintText: 'Masukan Password',
                  icon: Icons.lock_outline,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFB7E0FF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(vertical: 10),
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, AppRoutes.home);
          },
          child: const Text(
            'Masuk',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
