import 'package:sportfan/data/fifafancontroller.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:get/get.dart';
import 'package:sportfan/utils/timer.dart';

class ChatWithFriend extends StatefulWidget {
  String chatName;
  String userId;
  String followerId;
  bool canChat;

  ChatWithFriend({
    this.chatName, this.userId, this.followerId, this.canChat,
});
  @override
  _ChatWithFriendState createState() => _ChatWithFriendState();
}

class _ChatWithFriendState extends State<ChatWithFriend> {
  TextEditingController controller = TextEditingController();
  FifaController fifaController = Get.put(FifaController());
  IO.Socket socket = Get.find();

  @override
  void initState() {
    fifaController.groupPostListData.assignAll([]);
    fifaController.joinChat(socket, "${this.widget.userId}${this.widget.followerId}");
    fifaController.getPersonalChats(this.widget.followerId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${this.widget.chatName}',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              letterSpacing: 2.0),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.only(top: 10.0),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Obx(() =>
              MyTimer().groupChats(fifaController.personalMessageChats, fifaController),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 5.0, right: 5.0, bottom: 3.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.blueGrey,
                ),
                child: this.widget.canChat == false ? GestureDetector(
                  onTap: () {

                  },
                  child: Center(
                    child: Text('Follow User',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w800
                      ),
                    ),
                  ),
                ) : Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: new TextField(
                            controller: controller,
                            maxLines: null,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              hintText: "Input a message",
                              hintStyle: new TextStyle(color: Colors.grey[300]),
                              // suffixIcon:
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () => {
                          // send message
                          // this text field gets focused
                          if (controller.text.toString().isNotEmpty) {
                            sendMessage()
                          }
                        },
                        icon: Icon(Icons.send, color: Colors.white,),
                      ),
                    ],
                  ),
                ),
              ),
            )
            ]
        ),
      ),
    );
  }

  void sendMessage() {
    // print(controller.text.toString());
    fifaController.sendPersonaMessage(socket,
        "${this.widget.userId}${this.widget.followerId}",
        controller.text.toString(), this.widget.followerId);
      controller.text = "";
    // fifaController.getGroupPost(this.widget.roomId);
  }
}
