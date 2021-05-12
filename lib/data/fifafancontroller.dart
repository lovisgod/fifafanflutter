import 'dart:io';

import 'package:fifafan/domain/PostList.dart';
import 'package:fifafan/domain/personal_message_list_model.dart';
import 'package:fifafan/domain/post.dart';
import 'package:fifafan/domain/post_response_class.dart' as postres;
import 'package:fifafan/domain/room_chat_list.dart';
import 'package:fifafan/network/error.dart';
import 'package:fifafan/repository/podcatListRepository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './../network/service.dart';
import 'package:get_storage/get_storage.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:fifafan/bloc/socketBloc.dart';



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
  var postListData = List<postres.PostData>().obs;
  var groupPostListData = List<Chats>.empty().obs;
  var personalMessageChats =  List<PersonalChatData>.empty().obs;

  var repo = FifaRepository();

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

    // setupSocket();

    super.onInit();
  }

  setSocket(IO.Socket socket) {
    print("this is socket id: ${socket.id}");
    Get.put(socket);
  }

  /// Send message to group using socket**/
  sendMessage(IO.Socket socket, String message, String groupId) {
    print("message_group => ${socket.id}");
    print("message_group => ${groupId}");
    print("message_group => ${message}");
    socket.emit("${groupId}-message", {
      "message": message,
      "group_id": groupId
    });
  }
  
  /// Join group with socket
  joinGroup(IO.Socket socket, String groupId) {
    print("join-group => ${socket.id}");
    print("join-group => ${groupId}");
    socket.emit("join-room", {
      "group_uuid": groupId
    });
  }

  joinChat(IO.Socket socket, String chatId) {
    print("join-chat => ${socket.id}");
    print("join-chat => ${chatId}");
    socket.emit("join-chat", {
      "chat_uuid": chatId
    });
  }

  sendPersonaMessage(IO.Socket socket, String chat_uuid, String message, String recep_uuid) {
    socket.emit("${chat_uuid}-message", {
      "message": message,
      "chat_uuid": chat_uuid,
      "recipient_uuid": recep_uuid

    });
  }

  
  
  loginApi() async {
    return FifaService.loginUser(
        email: loginEmailTextController.text.toString(),
        password: loginPasswordTextController.text.toString());
  }

  refreshToken(String email, String token) async {
    return FifaService.refreshToken(
        email: email,
        token: token);
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
      List<postres.PostData> listofPosts = List<postres.PostData>();
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

  void saveEmail(String email) {
    print(email);
    prefs.write('email', email);
  }

  void saveUuid(String uuid) {
    print(uuid);
    prefs.write('uuid', uuid);
  }

  String getUuid() {
    String uuid =prefs.read('uuid').toString();
     if (uuid.isNotEmpty) {
      debugPrint(uuid);
      return uuid;
    } else {
       return "";
     }

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
    super.onClose();
  }


  void setupSocket() {
    StreamSocket streamSocket = StreamSocket();
    var token = getToken();
    var builder = IO.OptionBuilder()
        .setTransports(['websocket'])
        .setExtraHeaders({'token': '${token.isNotEmpty ? token : ''}'})
        .build();
    IO.Socket socket = IO.io('https://fifafans.herokuapp.com', builder);
    socket.onConnect((_) {
      print('connect');
      print(socket.id);
     setSocket(socket);
    });

    socket.onConnectError((data) => print('connection error: ${data}'));

    socket.connect();

    // streamSocket.addSocket(socket);

    //When an event recieved from server, data is added to the stream
    socket.on('message', (data) => print(data));
    socket.on('personalMessage', (data) => addPersonalChats(data));
    socket.onDisconnect((_) => print('disconnect'));
  }

  void addPersonalChats(dynamic data) {
    var chat = PersonalChatData.fromJson(data);
    personalMessageChats.addNonNull(chat);
  }


  void getGroupPost(String group_id) async {
    var response = await repo.getGroupPosts(group_id);
    groupPostListData.assignAll(response);
    print("this is chat list => ${groupPostListData}");
  }

  void getPersonalChats(String follower_uuid) async {
    var response = await repo.getPersonalMessages(follower_uuid);
    personalMessageChats.assignAll(response);
    print("this is chat list => ${personalMessageChats}");
  }
}
