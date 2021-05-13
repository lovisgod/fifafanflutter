import 'package:sportfan/bloc/socketBloc.dart';
import 'package:sportfan/data/fifafancontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:sportfan/utils/timer.dart';


class RoomChatPage extends StatefulWidget {
  String chatName;
  String userId;
  String roomId;
  bool canChat;

  RoomChatPage({
    this.chatName, this.userId = '', this.roomId, this.canChat,
});
  @override
  _ChatWithRoomState createState() => _ChatWithRoomState();
}

class _ChatWithRoomState extends State<RoomChatPage> {
  final _formKey = GlobalKey<FormState>();


  TextEditingController controller = TextEditingController();
  FifaController fifaController = Get.put(FifaController());
  IO.Socket socket = Get.find();



  @override
  void initState() {
    fifaController.groupPostListData.assignAll([]);
    fifaController.joinGroup(socket, this.widget.roomId);
    fifaController.getGroupPost(this.widget.roomId);
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
        padding: EdgeInsets.only(top: 10),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Obx(() =>
                  MyTimer().groupRoomChats(fifaController.groupPostListData, fifaController)
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
                    child: Text('Join group',
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
          ],
        ),
      ),
    );
  }

  void sendMessage() {
     // print(controller.text.toString());
    fifaController.sendMessage(socket, controller.text.toString(), this.widget.roomId);
    controller.text = "";
    fifaController.getGroupPost(this.widget.roomId);
  }
}
