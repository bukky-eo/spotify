import 'package:flutter/material.dart';
import 'package:spotify/screens/auth/intro_info.dart';
import 'package:spotify/screens/auth/splash_screen.dart';

void main() {
  runApp(const Spotify());
}

class Spotify extends StatelessWidget {
  const Spotify({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
    );
  }
}
