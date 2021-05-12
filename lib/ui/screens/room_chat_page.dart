import 'package:fifafan/bloc/socketBloc.dart';
import 'package:fifafan/data/fifafancontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;


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
        child: Stack(
          children: [
            new ListView(
              shrinkWrap: true,
              children: <Widget>[
                Obx(() =>
                  new Expanded(
                    child: ListView.builder(
                      itemCount: fifaController.groupPostListData.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.only(top: 10,bottom: 30),
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index){
                        return Container(
                          padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                          child: Align(
                            alignment: (
                                fifaController.getUuid() == fifaController.groupPostListData[index].senderUuid ? Alignment.topRight : Alignment.topLeft),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: (fifaController.getUuid() == fifaController.groupPostListData[index].senderUuid ? Colors.blueAccent : Colors.grey),
                              ),
                              padding: EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('${fifaController.groupPostListData[index].sendername}', style: TextStyle(fontSize: 10, color:(
                                      fifaController.getUuid() == fifaController.groupPostListData[index].senderUuid ? Colors.white : Colors.grey
                                  ) ),),
                                  Text('${fifaController.groupPostListData[index].message}', style: TextStyle(fontSize: 15, color: Colors.black),),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
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
