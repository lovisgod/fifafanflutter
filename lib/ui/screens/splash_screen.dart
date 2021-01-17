import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';

class FifaFanSplashScreen extends StatefulWidget {
  @override
  _FifaFanSplashScreenState createState() => _FifaFanSplashScreenState();
}

class _FifaFanSplashScreenState extends State<FifaFanSplashScreen> {
  @override
  void initState() {
    super.initState();
    _loadPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Fifafan",
          style: TextStyle(
              fontSize: 50.0, fontWeight: FontWeight.w600, color: Colors.blue),
        ),
      ),
    );
  }

  void navigateTO() {
    Get.offNamed('/auth/login');
  }

  _loadPage() async {
    var _duration = Duration(seconds: 5);
    return Timer(_duration, navigateTO);
  }
}
