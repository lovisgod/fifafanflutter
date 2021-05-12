import 'package:sportfan/domain/groupModel.dart';
import 'package:sportfan/domain/group_list_response.dart';
import 'package:sportfan/ui/screens/room_chat_page.dart';
import 'package:flutter/material.dart';

class Groups extends StatelessWidget {
  final List<GroupData> groups;

  Groups({this.groups});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 1.0),
          child: Text(
            'Suggested Groups',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
            ),
          ),
        ),
        Container(
          height: 200.0,
          child: ListView.builder(
              padding: EdgeInsets.only(left: 10.0),
              scrollDirection: Axis.horizontal,
              itemCount: groups.length,
              itemBuilder: (BuildContext context, int index) {
                GroupData group = groups[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RoomChatPage(chatName: group.name, canChat: false, roomId: group.uuid,)),
                    );
                  },
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(10.0),
                        height: 100.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                                width: 1.0,
                                color: Theme.of(context).primaryColor),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 2),
                                  blurRadius: 6.0)
                            ]),
                        child: ClipOval(
                          child: Image(
                            height: 100.0,
                            width: 100.0,
                            fit: BoxFit.cover,
                            image: NetworkImage(group.icon ??
                                "https://res.cloudinary.com/psirius-eem/image/upload/v1612957194/media_mall/185d9c23-2f18-422c-b197-ddf26f6e4bbd.jpg"),
                          ),
                        ),
                      ),
                      Container(
                        height: 13.0,
                        child: Text(
                          group.name.toString(),
                          style: TextStyle(
                              fontSize: 12.0,
                              color: Theme.of(context).primaryColor),
                        ),
                      )
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }
}
