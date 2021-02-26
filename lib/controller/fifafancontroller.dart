import 'package:fifafanmobile/models/post_response_class.dart' as postres;
import 'package:fifafanmobile/network/error.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './../network/service.dart';

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

  var prefs = SharedPreferences.getInstance();
  var token = '';
  var userToken = '';
  var postListData = List<postres.Data>().obs;

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

    // token = prefs.read('token');
    prefs = prefs.then((value) => value);

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

  void getAllPosts() async {
    Future.delayed(
        Duration.zero,
        () => Get.dialog(Center(child: CircularProgressIndicator()),
            barrierDismissible: false));
    Map<String, dynamic> response = await FifaService.getPosts();
    if (response is ErrorType) {
      print('error is here');
      Get.back();
    } else {
      List<postres.Data> listofPosts = List<postres.Data>();
      if (response['data'] == null) {
        listofPosts = [];
      } else {
        listofPosts = postres.PostResponseClass.fromJson(response).data;
      }
      postListData.value = listofPosts;
      Get.back();
    }
  }

  void saveToken(String incomingToken) {
    prefs.then((value) => value.setString("token", incomingToken));
    // prefs.write('token', incomingToken);
    token = incomingToken;
  }

  Future<String> getToken() {
    return prefs.then((value) => value.getString("token"));
  }

  @override
  void onClose() {
//    loginPasswordTextController.dispose();
//    loginEmailTextController.dispose();
//
//    signUpEmailTextController.dispose();
//    signUpPasswordTextController.dispose();
    super.onClose();
  }
}
