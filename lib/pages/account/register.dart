import 'package:fashiona_mobile/pages/account/login.dart';
import 'package:fashiona_mobile/pages/account/profile.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                          label: Text('Full Name'),
                          hintText: 'enter your full name here',
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Email'),
                          hintText: 'Your Email address',
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Phone Number'),
                          hintText: 'your phone number',
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Password'),
                          hintText: 'choose a password',
                        ),
                      ),
                      Padding(padding: EdgeInsets.symmetric(vertical: 12.0)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            child: GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ),
                              ),
                              child: const Text("Already have an Account?"),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MaterialButton(
                            minWidth: 300.0,
                            height: 40.0,
                            color: Colors.deepPurple,
                            // TODO: register funtionality
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const ProfilePage(),
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
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
