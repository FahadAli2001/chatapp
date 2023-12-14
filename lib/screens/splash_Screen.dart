 import 'dart:async';

import 'package:chatapp/api/apis.dart';
import 'package:chatapp/screens/auth/login_screen.dart';
import 'package:chatapp/screens/home_screen.dart';
import 'package:flutter/material.dart';
 import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
   //  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);//exit full screen
     super.initState();
    Timer(Duration(seconds: 4), () { 
       Apis.auth.currentUser != null ?Get.to(()=>HomeScreen()):Get.to(()=>LoginScreen());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/logo.png"),
      ),
    );
  }
}