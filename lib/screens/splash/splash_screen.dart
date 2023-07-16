import 'package:flutter/material.dart';
import 'package:flutter_application_2/configs/themes/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(gradient: mainGradient()),
          child: Center(
            child: SizedBox(
              width: 200,
              height: 200,
              child: Image.asset(
                "assets/images/app_splash_logo.png",
              ),
            ),
          ),
        ),
      ),
    );
  }
}


/*
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Container(
          decoration: BoxDecoration(gradient: mainGradient(context)),
          child: Image.asset(
            "assets/images/app_splash_logo.png",
            width: 200,
            height: 200,
          ),
        ),
      ),
    ));
  }
}*/

/*
class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(gradient: mainGradient(context)),
          child: Image.asset("assets/images/app_splash_logo.png"),
        ),
      ),
    ));
  }
}*/
