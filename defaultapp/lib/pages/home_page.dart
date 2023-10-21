// ignore_for_file: prefer_const_constructors

import 'package:defaultapp/pages/index_page/first_page.dart';
import 'package:defaultapp/pages/index_page/profile_page.dart';
import 'package:defaultapp/pages/index_page/recent_page.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  bool searching = false;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    FirstPage(),
    RecentPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: searching == false
                ? Text(
                    'App name',
                    style: TextStyle(color: Colors.grey.shade800),
                  )
                : TextField()),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                setState(() {
                  searching = !searching;
                });
              },
              icon: Icon(
                Icons.search,
                color: Colors.grey.shade800,
              ),
            ),
          ),
        ],
      ),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: TextStyle(color: Colors.black),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.grey,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Request',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.grey.shade900,
        onTap: _onItemTapped,
      ),
    );
  }
}
