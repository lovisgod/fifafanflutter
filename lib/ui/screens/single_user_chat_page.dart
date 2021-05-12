import 'package:fifafan/data/fifafancontroller.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:get/get.dart';

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
        child: Stack(
          children: [
            Obx(() =>
            new ListView(
              children: <Widget>[
                new Expanded(
                  child: ListView.builder(
                    itemCount: fifaController.personalMessageChats.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 10,bottom: 10),
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index){
                      return Container(
                        padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                        child: Align(
                          alignment: (Alignment.topLeft),
                          child: Container(
                            padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                            child: Align(
                              alignment: (
                                  fifaController.getUuid() == fifaController.personalMessageChats[index].senderUuid ? Alignment.topRight : Alignment.topLeft),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: (fifaController.getUuid() == fifaController.personalMessageChats[index].senderUuid ? Colors.blueAccent : Colors.grey),
                                ),
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    // Text('${fifaController.personalMessageChats[index].}', style: TextStyle(fontSize: 10, color:(
                                    //     fifaController.getUuid() == fifaController.personalMessageChats[index].senderUuid ? Colors.white : Colors.grey
                                    // ) ),),
                                    Text('${fifaController.personalMessageChats[index].message}', style: TextStyle(fontSize: 15, color: Colors.black),),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
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
