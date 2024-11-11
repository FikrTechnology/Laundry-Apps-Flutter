part of 'pages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
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
                TextFieldLeading(
                  label: 'Username',
                  hintText: 'Masukan Username',
                  icon: Icons.email_outlined,
                  controller: _usernameCtrl,
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFieldLeading(
                  label: 'Password',
                  hintText: 'Masukan Password',
                  icon: Icons.lock_outline,
                  controller: _passwordCtrl,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFB7E0FF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(vertical: 10),
          ),
          onPressed: () async {
            String username = _usernameCtrl.text;
            String password = _passwordCtrl.text;
            await LoginService().login(username, password).then((value) {
              if (value == true) {
                Navigator.pushReplacementNamed(context, AppRoutes.home);
              } else {
                AlertDialog alertDialog = AlertDialog(
                  content: const Text('Username atau password tidak valid'),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      child: const Text('OK'),
                    )
                  ],
                );
                showDialog(
                    context: context, builder: (context) => alertDialog);
              }
            });
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
