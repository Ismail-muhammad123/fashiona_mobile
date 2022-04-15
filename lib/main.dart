import 'package:fashiona_mobile/pages/account/authenticate.dart';
import 'package:fashiona_mobile/pages/details.dart';
import 'package:fashiona_mobile/pages/home/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fashiona Mobile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Authenticate(),
    );
  }
}
