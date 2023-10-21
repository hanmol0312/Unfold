// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class UserCard extends StatefulWidget {
  //RequestCard
  //({super.key, required this.user});

  @override
  State<UserCard> createState() => UserCardState();
}

class UserCardState extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Column(
      children: [
        Card(
          margin: EdgeInsets.symmetric(horizontal: mq.width * .02, vertical: 4),
          child: InkWell(
            onTap: () {},
            child: ListTile(
              style: ListTileStyle.drawer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
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
              subtitle: Text("User Last Message"),
              trailing: Icon(Icons.message_outlined),
            ),
          ),
        ),
      ],
    );
  }
}
