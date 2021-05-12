import 'dart:async';

import 'package:sportfan/data/fifafancontroller.dart';
import 'package:sportfan/network/error.dart';
import 'package:sportfan/network/errorHelper.dart';
import 'package:sportfan/ui/views/flushAlert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FifaFanSplashScreen extends StatefulWidget {
  @override
  _FifaFanSplashScreenState createState() => _FifaFanSplashScreenState();
}

class _FifaFanSplashScreenState extends State<FifaFanSplashScreen> {
  final FifaController controller = Get.put(FifaController());

  @override
  void initState() {
    super.initState();
    _loadPage();
  }

  @override
  Widget build(BuildContext context) {
    // handleRefresh(context);
    return Scaffold(
      body: Center(
        child: Text(
          "SPORTFANS",
          style: TextStyle(
              fontSize: 50.0, fontWeight: FontWeight.w600, color: Colors.blue),
        ),
      ),
    );
  }

  void navigateTO() {
    final FifaController controller = Get.put(FifaController());
    var token = controller.getToken();
    debugPrint(token);
    if (token.isNotEmpty) {
      Get.toNamed('/homePage');
    } else {
      Get.toNamed('/auth/login');
    }
  }

  _loadPage() async {
    var _duration = Duration(seconds: 3);
    return Timer(_duration, navigateTO);
  }

  static String getToken() {
    var prefs = GetStorage();
    var token = prefs.read('token');
    return token.toString();
  }

  static String getEmail() {
    var prefs = GetStorage();
    var email = prefs.read('email');
    return email.toString();
  }

  handleRefresh(BuildContext context) async {
    try {
      var res = await controller.refreshToken(getEmail(), getToken());
      if (res is ErrorType) {
        FlushAlert.show(
          context: context,
          message: errorTypeToString(res),
          isError: true,
        );
      } else {
        String token = res['data']['token'];
        print(token);
        controller.saveToken(token);
      }
    } catch (error) {
      print(error);
    }
  }
}
