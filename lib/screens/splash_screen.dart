import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late AnimationController slideAnimation;
  late Animation<Offset> offsetAnimation;
  late Animation<Offset> imageAnimation;
  @override
  void initState() {
    animationController = AnimationController(
        vsync: this,
        lowerBound: 0,
        upperBound: 60,
        animationBehavior: AnimationBehavior.normal,
        duration: const Duration(milliseconds: 700));
    slideAnimation = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
    animationController.forward();
    offsetAnimation = Tween<Offset>(
            begin: Offset.zero, end: const Offset(-0.05, 0.0))
        .animate(CurvedAnimation(parent: slideAnimation, curve: Curves.easeIn));
    imageAnimation = Tween<Offset>(
      begin: const Offset(-0.5, -0.5),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(parent: slideAnimation, curve: Curves.easeIn));
    animationController.addStatusListener((status) {});
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const AuthPage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
