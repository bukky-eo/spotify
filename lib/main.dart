import 'package:flutter/material.dart';
import 'package:spotify/screens/splash_screen.dart';

void main() {
  runApp(const Spotify());
}

class Spotify extends StatelessWidget {
  const Spotify({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
