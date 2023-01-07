import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotify/screens/music/explore.dart';

import '../../helpers/constants.dart';
import 'account.dart';
import 'home.dart';
import 'library.dart';

class IntroMusic extends StatefulWidget {
  const IntroMusic({Key? key}) : super(key: key);

  @override
  State<IntroMusic> createState() => _IntroMusicState();
}

class _IntroMusicState extends State<IntroMusic> {
  int selectedIndex = 0;

  void navBarTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List<Widget> pages = const [
    Home(),
    Explore(),
    Library(),
    Account(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: kGreen,
        unselectedItemColor: Colors.grey,
        currentIndex: selectedIndex,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        onTap: navBarTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: ''),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.compass), label: ''),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.heart), label: ''),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.person), label: ''),
        ],
      ),
      body: pages[selectedIndex],
    );
  }
}
