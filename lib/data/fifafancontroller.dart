import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './../network/service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FifaController extends GetxController {
  TextEditingController loginEmailTextController;
  TextEditingController loginPasswordTextController;

  TextEditingController signUpEmailTextController;
  TextEditingController signUpPasswordTextController;
  TextEditingController signUpClubTextController;
  TextEditingController signUpFullNameTextController;
  TextEditingController signUpUserNameTextController;
  TextEditingController signUpPhoneNumberTextController;
  TextEditingController signUpConfirmPasswordTextController;
  String role;

  SharedPreferences prefs;
  var token = ''.obs;

  @override
  void onInit() {
    loginPasswordTextController = TextEditingController();
    loginEmailTextController = TextEditingController();

    signUpEmailTextController = TextEditingController();
    signUpPasswordTextController = TextEditingController();
    signUpClubTextController = TextEditingController();
    signUpFullNameTextController = TextEditingController();
    signUpUserNameTextController = TextEditingController();
    signUpPhoneNumberTextController = TextEditingController();
    signUpConfirmPasswordTextController = TextEditingController();

    prefs = SharedPreferences.getInstance() as SharedPreferences;

    token = prefs.getString('token') as RxString;

    role = '';

    super.onInit();
  }

  loginApi() async {
    return FifaService.loginUser(
        email: loginEmailTextController.text.toString(),
        password: loginPasswordTextController.text.toString());
  }

  signUpApi() async {
    return FifaService.registerUser(
        email: signUpEmailTextController.text.toString(),
        password: signUpPasswordTextController.text.toString(),
        confirmPassword: signUpConfirmPasswordTextController.text.toString(),
        fullname: signUpFullNameTextController.text.toString(),
        username: signUpUserNameTextController.text.toString(),
        phonenumber: signUpPhoneNumberTextController.text.toString(),
        club: signUpClubTextController.text.toString(),
        role: role);
  }

  void saveToken(String incomingToken) {
    prefs.setString('token', incomingToken);
    token = incomingToken as RxString;
  }

  RxString getToken() {
    if (!prefs.getString('token').isNullOrBlank) {
      token = prefs.getString('token') as RxString;
    }
    return token;
  }

  @override
  void onClose() {
    loginPasswordTextController.dispose();
    loginEmailTextController.dispose();

    signUpEmailTextController.dispose();
    signUpPasswordTextController.dispose();
    super.onClose();
  }
}
