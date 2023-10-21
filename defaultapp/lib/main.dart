// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:defaultapp/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';

late Size mq;
void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return MaterialApp(
      theme: ThemeData(
        appBarTheme:
            AppBarTheme(backgroundColor: Colors.white.withOpacity(0.8)),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: LoginUser(),
    );
  }
}
