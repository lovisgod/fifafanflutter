import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './../network/service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_storage/get_storage.dart';

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
  var role = 'fan'.obs;

  var prefs = GetStorage();
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

    prefs = GetStorage();

    token = prefs.read('token') as RxString;

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
        role: role.toString());
  }

  void saveToken(String incomingToken) {
    prefs.write('token', incomingToken);
    token = incomingToken as RxString;
  }

  RxString getToken() {
    if (!prefs.read('token').isNullOrBlank) {
      token = prefs.read('token') as RxString;
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
