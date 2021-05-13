import 'package:sportfan/data/fifafancontroller.dart';
import 'package:sportfan/domain/personal_message_list_model.dart';
import 'package:flutter/material.dart';
import 'package:sportfan/domain/room_chat_list.dart';
import 'package:sticky_grouped_list/sticky_grouped_list.dart';
import "package:collection/collection.dart";

class MyTimer {
  String duration(DateTime timestamp) {
    String x;
    final time = timestamp.toUtc();
    final now = DateTime.now();
    final difference = now.difference(time).inDays;
    final hdif = now.difference(time).inHours;
    if (hdif > 24) {
      x = '${difference} days ago';
    } else {
      x = '${hdif} hours ago';
    }
    return x;
  }

  ListView groupChats(
      List<PersonalChatData> chats, FifaController fifaController) {
    var groupByDate = groupBy(chats, (PersonalChatData obj) => obj.createdAt.substring(0, 10));

    final dateItem =  groupByDate.map((key, value) => MapEntry(
        key,
        Column(
          children: [
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.greenAccent
                ),
                padding: EdgeInsets.all(5),
                child: Text("$key")
            ),
            Container(
              //constraints: BoxConstraints(minHeight: 0.0, maxHeight: 100),
              child: ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: value.length,
                  itemBuilder: (context, index) {
                final listItem = value[index];
                return Container(
                  padding:
                      EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
                  child: Align(
                    alignment: (Alignment.topLeft),
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 14, right: 14, top: 10, bottom: 10),
                      child: Align(
                        alignment:
                            (fifaController.getUuid() == listItem.senderUuid
                                ? Alignment.topRight
                                : Alignment.topLeft),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color:
                                (fifaController.getUuid() == listItem.senderUuid
                                    ? Colors.blueAccent
                                    : Colors.grey),
                          ),
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // Text('${fifaController.personalMessageChats[index].}', style: TextStyle(fontSize: 10, color:(
                              //     fifaController.getUuid() == fifaController.personalMessageChats[index].senderUuid ? Colors.white : Colors.grey
                              // ) ),),
                              Text(
                                '${listItem.message}',
                                style:
                                    TextStyle(fontSize: 15, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );

              }),
            )
          ],
        ))).values.toList();

    return ListView(children: dateItem);
  }


  ListView groupRoomChats(
      List<Chats> chats, FifaController fifaController) {
    var groupByDate = groupBy(chats, (Chats obj) => obj.createdAt.substring(0, 10));

    final dateItem =  groupByDate.map((key, value) => MapEntry(
        key,
        Column(
          children: [
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.greenAccent
                ),
                padding: EdgeInsets.all(5),
                child: Text("$key")
            ),
            Container(
              //constraints: BoxConstraints(minHeight: 0.0, maxHeight: 100),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    final listItem = value[index];
                    return Container(
                      padding:
                      EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
                      child: Align(
                        alignment: (Alignment.topLeft),
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 14, right: 14, top: 10, bottom: 10),
                          child: Align(
                            alignment:
                            (fifaController.getUuid() == listItem.senderUuid
                                ? Alignment.topRight
                                : Alignment.topLeft),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color:
                                (fifaController.getUuid() == listItem.senderUuid
                                    ? Colors.blueAccent
                                    : Colors.grey),
                              ),
                              padding: EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('${listItem.sendername}',
                                    style: TextStyle(fontSize: 10, color:(
                                      fifaController.getUuid() == listItem.senderUuid ? Colors.white : Colors.grey
                                  ) ),),
                                  Text(
                                    '${listItem.message}',
                                    style:
                                    TextStyle(fontSize: 15, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );

                  }),
            )
          ],
        ))).values.toList();

    return ListView(children: dateItem);
  }
}
