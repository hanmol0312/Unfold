// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, use_key_in_widget_constructors, sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class RequestCard extends StatefulWidget {
  //RequestCard
  //({super.key, required this.user});

  @override
  State<RequestCard> createState() => RequestCardState();
}

class RequestCardState extends State<RequestCard> {
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Card(
      margin: EdgeInsets.symmetric(horizontal: mq.width * .02, vertical: 4),
      child: InkWell(
        onTap: () {},
        child: ListTile(
            style: ListTileStyle.drawer,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            leading: CircleAvatar(
              child: Icon(CupertinoIcons.person),
            ),
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(mq.height * .3),
            //   child: CachedNetworkImage(
            //     fit: BoxFit.fill,
            //     height: mq.height * .055,
            //     width: mq.height * .055,
            //     imageUrl: widget.user.image,
            //     // placeholder: (context, url) => CircularProgressIndicator(),
            //     errorWidget: (context, url, error) => CircleAvatar(
            //       child: Icon(CupertinoIcons.person),
            //     ),
            //   ),
            // ),
            title: Text("UserName"),
            subtitle: Text("UserAbout"),
            trailing: TextButton(
              child: Text("View Profile"),
              onPressed: () {
                BottomSheet(context);
              },
            )),
      ),
    );
  }

  Future<dynamic> BottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => Container(
              height: mq.height * .45,
              child: Padding(
                padding: const EdgeInsets.only(top: 40, left: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 40,
                        child: Icon(
                          CupertinoIcons.person,
                          size: 40,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Text(
                          "User name",
                          style: TextStyle(
                              fontSize: 30, color: Colors.grey.shade800),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Gender : M / Age : 18",
                          style: TextStyle(
                              fontSize: 20, color: Colors.grey.shade800),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Text(
                            'Activities : Activity list',
                            style: TextStyle(
                                fontSize: 25, color: Colors.grey.shade800),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Past Interaction : 10',
                            style: TextStyle(
                                fontSize: 25, color: Colors.grey.shade800),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 60, top: 20),
                      child: Row(
                        children: [
                          ElevatedButton(
                              style: ButtonStyle(),
                              onPressed: () {
                                //Delete user request card and user to connected user
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text("Accept"),
                              )),
                          SizedBox(
                            width: 20,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                //Delete user request card
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text("Reject"),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}
