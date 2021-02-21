import 'package:fifafan/domain/PostList.dart';
import 'package:fifafan/domain/post.dart';
import 'package:fifafan/domain/post_response_class.dart' as postres;
import 'package:fifafan/network/error.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './../network/service.dart';
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

    prefs = GetStorage();

    token = prefs.read('token');

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
    prefs.write('token', incomingToken);
    token = incomingToken;
  }

  String getToken() {
    if (prefs.read('token').toString().isNotEmpty) {
      token = prefs.read('token');
    }
    debugPrint(token.toString());
    return token.toString();
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
