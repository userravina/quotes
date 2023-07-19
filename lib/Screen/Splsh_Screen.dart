import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, 'home');
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffedd3d4),
        body: Center(
          child: Container(height: 65.h,width: 65.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),

            child: Image.asset('assets/images/quots.png'),
          ),
        ),
      ),
    );
  }
}