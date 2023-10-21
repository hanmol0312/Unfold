// ignore_for_file: prefer_const_constructors

import 'package:defaultapp/main.dart';
import 'package:flutter/material.dart';

import '../../widgets/request_card.dart';

class RecentPage extends StatefulWidget {
  const RecentPage({super.key});

  @override
  State<RecentPage> createState() => _RecentPageState();
}

class _RecentPageState extends State<RecentPage> {
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(top: mq.height * .01),
        itemCount: 2,
        itemBuilder: (context, index) {
          return RequestCard();
        });
  }
}
