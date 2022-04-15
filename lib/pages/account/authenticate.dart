import 'package:fashiona_mobile/pages/account/login.dart';
import 'package:fashiona_mobile/pages/account/register.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  void initState() {
    super.initState();
    //TODO: get cookies or show login page
    Future.delayed(
      const Duration(
        seconds: 5,
      ),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage(
            'assets/images/splash_bg.jpeg',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            height: double.maxFinite,
            width: double.maxFinite,
            color: Colors.deepPurple.withOpacity(0.7),
          ),
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome to'.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.purpleAccent,
                      fontWeight: FontWeight.w600,
                      fontSize: 24.0,
                    ),
                  ),
                  Text(
                    'Fashiona'.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 36.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
