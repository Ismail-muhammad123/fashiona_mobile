import 'package:fashiona_mobile/pages/account/register.dart';
import 'package:fashiona_mobile/pages/home/home.dart';
import 'package:fashiona_mobile/pages/account/reset_password.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Sign in',
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 40.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          'Fill in the form with your account details',
                          style: TextStyle(
                            color: Colors.purple.withOpacity(0.3),
                            fontSize: 18.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0)),
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text('Email'),
                            hintText: 'Your Email address',
                          ),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text('Password'),
                            hintText: 'Password',
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              child: GestureDetector(
                                onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ForgetPasswordPage())),
                                child: const Text('forgot password?'),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              child: GestureDetector(
                                onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const RegisterPage(),
                                  ),
                                ),
                                child: const Text("Don't have an Account?"),
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 12.0)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MaterialButton(
                              minWidth: 300.0,
                              height: 40.0,
                              color: Colors.deepPurple,
                              // TODO: sign in funtionality
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const HomePage(),
                                  ),
                                );
                              },
                              child: const Text(
                                "Submit",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
