// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_import, avoid_print

import 'package:defaultapp/pages/sign_in_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import '../integration/function.dart';
import '../main.dart';
import 'package:defaultapp/constants/constant.dart';

class LoginUser extends StatefulWidget {
  const LoginUser({super.key});

  @override
  State<LoginUser> createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {
  bool flag = true;
  Client? httpClient;
  late final String a;
  Web3Client? ethclient;
  late String name = '';

  @override
  void initState() {
    httpClient = Client();
    ethclient = Web3Client(infuraurl, httpClient!);
    // ignore: await_only_futures
    //display(ethclient);
    // display(ethclient).then((value) {
    //   if (value == null) {
    //     print(null);
    //   } else {
    //     print(value);
    //   }
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    minimumSize: Size(mq.width * .4, mq.height * .06)),
                onPressed: () async {
                  pdisplay(ethclient!).then((value) => name = value);
                  setState(() {
                    flag = false;
                  });
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return UserScreen(
                        ethClient: ethclient!,
                      );
                    },
                  ));
                },
                child: Text(
                  flag ? "CONNECT" : name,
                  style: TextStyle(fontSize: 16),
                )),
          )
        ],
      ),
    );
  }
}
