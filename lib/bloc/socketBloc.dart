import 'dart:async';
import 'dart:io';
import 'package:fifafan/domain/room_chat_list.dart';
import 'package:fifafan/network/networking/ResponseHelper.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;


class StreamSocket{

  StreamSocket();

  // StreamController groupChatListController =
  // StreamController<FifaResponseResponse<Room_chat_list>>();

  final _socketResponse= StreamController<String>();

  void Function(String) get addResponse => _socketResponse.sink.add;



  Stream<String> get getResponse => _socketResponse.stream;




  void dispose(){
    _socketResponse.close();
    // groupChatListController.close();
  }
}