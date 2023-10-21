// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../main.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    //TextEditingController _date = TextEditingController();
    mq = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: FloatingActionButton.extended(
          icon: Icon(Icons.logout),
          backgroundColor: Colors.red.shade400,
          label: Text("LOGOUT"),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: mq.height * .03),
        child: ListView(
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              SizedBox(
                height: mq.height * .03,
              ),
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      child: Icon(
                        CupertinoIcons.person,
                        size: 50,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: -30,
                      child: MaterialButton(
                        elevation: 1,
                        color: Colors.white,
                        shape: CircleBorder(),
                        onPressed: () {},
                        child: Icon(
                          Icons.edit,
                          color: Colors.blue,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: mq.width * .03,
              ),
              Text("Email"),
              SizedBox(
                height: mq.width * .1,
              ),
            ]),
            UserDescription(
              DetailName: "Name",
              Detail: "Aman raval",
              icon: Icon(Icons.person),
              EditDetail: '',
              InitialValue: '',
            ),
            SizedBox(
              height: 10,
            ),
            UserDescription(
              DetailName: "Bio",
              Detail: "Nothing",
              icon: Icon(Icons.info_outline),
              EditDetail: '',
              InitialValue: '',
            ),
            SizedBox(
              height: 10,
            ),
            UserDescription(
              DetailName: "Age",
              Detail: "18yrs",
              icon: Icon(Icons.numbers),
              EditDetail: '',
              InitialValue: '',
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class UserDescription extends StatelessWidget {
  final String DetailName;
  final String Detail;
  final String EditDetail;
  final String InitialValue;
  final Icon icon;
  const UserDescription({
    super.key,
    required this.DetailName,
    required this.Detail,
    required this.icon,
    required this.EditDetail,
    required this.InitialValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white38,
      height: mq.height * .07,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.person),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DetailName,
                      style:
                          TextStyle(fontSize: 15, color: Colors.grey.shade500),
                    ),
                    Text(
                      Detail,
                      style:
                          TextStyle(fontSize: 25, color: Colors.grey.shade500),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        // ignore: avoid_unnecessary_containers
                        return Container(
                          child: Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  EditDetail,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.grey.shade500),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  autofocus: true,
                                  initialValue: InitialValue,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 180),
                                  child: Row(
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "Save",
                                            style: TextStyle(fontSize: 20),
                                          )),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "Cancel",
                                            style: TextStyle(fontSize: 20),
                                          )),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      });
                },
                icon: Icon(Icons.edit),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
