// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, prefer_const_constructors, file_names

import 'package:defaultapp/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:defaultapp/style/styles.dart';
import 'package:intl/intl.dart';
import 'package:web3dart/web3dart.dart';
import 'package:defaultapp/integration/function.dart';

class UserScreen extends StatefulWidget {
  final Web3Client ethClient;

  static const String id = 'User_signin_screen';
  UserScreen({Key? key, required this.ethClient}) : super(key: key);
  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  // ignore: prefer_final_fields
  TextEditingController _date = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.question,
              size: 150,
            ),
            Text(
              "User Registration",
              style: optiontextstyle.copyWith(color: Colors.blueGrey),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 50, horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Enter Your name",
                    style: textStyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    style: TextStyle(color: Colors.black),
                    onChanged: (value) {},
                    decoration:
                        kTextFieldStyle.copyWith(hintText: 'Enter your name'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Enter Your DOB",
                    style: textStyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    readOnly: true,
                    controller: _date,
                    style: TextStyle(color: Colors.black),
                    decoration: kTextFieldStyle.copyWith(
                        hintText: 'Enter your DOB',
                        prefixIcon: Icon(Icons.calendar_today_rounded)),
                    onTap: () async {
                      // ignore: unused_local_variable
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2025));
                      if (pickedDate != null) {
                        setState(() {
                          _date.text =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                        });
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: TextButton(
                      style: ButtonStyle(
                          fixedSize:
                              MaterialStatePropertyAll(Size.fromHeight(50)),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.blue.shade300)),
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Upload Your Image",
                          style: detailTextStyle.copyWith(fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: TextButton(
                      style: ButtonStyle(
                          fixedSize:
                              MaterialStatePropertyAll(Size.fromHeight(60)),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.blue.shade300)),
                      onPressed: () async {
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return HomePage();
                          },
                        ));
                        await display(widget.ethClient);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Submit",
                          style: detailTextStyle,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
