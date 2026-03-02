import 'package:blinketclone/repository/screens/bottomnav/bottomnavscreen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginSuccessAniScreen extends StatefulWidget {
  const LoginSuccessAniScreen({Key? key}) : super(key: key);

  @override
  State<LoginSuccessAniScreen> createState() => _LoginSuccessScreenState();
}

class _LoginSuccessScreenState extends State<LoginSuccessAniScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) =>  BottomNavscreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset(
          'assets/animation/animation.json',
          width: 200,
          height: 200,
          repeat: false,
        ),
      ),
    );
  }
}
