// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../main.dart';
import '../../widgets/user_card.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(top: mq.height * .01),
        itemCount: 2,
        itemBuilder: (context, index) {
          return UserCard();
        });
  }
}
