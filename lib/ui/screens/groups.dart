import 'package:fifafan/bloc/fifauserBloc.dart';
import 'package:fifafan/domain/get_user_group_response.dart';
import 'package:fifafan/domain/group_list_response.dart';
import 'package:fifafan/network/networking/ResponseHelper.dart';
import 'package:fifafan/ui/screens/room_chat_page.dart';
import 'package:flutter/material.dart';
import 'package:fifafan/ui/views/loading.dart';
import 'package:fifafan/ui/views/error.dart';

class GroupsListPage extends StatefulWidget {
  @override
  _StateGroupPage createState() => _StateGroupPage();
}

class _StateGroupPage extends State<GroupsListPage> {
  TextEditingController search_view = TextEditingController();
  GroupListBloc groupListBloc = GroupListBloc();

  @override
  Widget build(BuildContext context) {
    groupListBloc.getUserGroups();
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 20.0, right: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.blueGrey,
                ),
                child: new TextField(
                  controller: search_view,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: "Search for a group you don\'t belong to",
                    hintStyle: new TextStyle(color: Colors.grey[300]),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 10,),
              Text(
                'Groups you belong to',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Expanded(
                child: StreamBuilder<FifaResponseResponse<GetUserGroupResponse>>(
                  stream: groupListBloc.userGroupListStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      switch (snapshot.data.status) {
                        case Status.LOADING:
                          return Loading(loadingMessage: snapshot.data.message);
                          break;
                        case Status.COMPLETED:
                          return ListView.separated(
                            itemBuilder: (BuildContext context, int index) {
                              return _buildGroupItem(context, snapshot.data.data.data.data[index].chatRoom);
                            },
                            separatorBuilder: (BuildContext context, int index) {
                              return Divider(
                                height: 1.0,
                                color: Colors.grey,
                              );
                            },
                            itemCount: 1,
                          );
                          break;
                        case Status.ERROR:
                          return Error(
                            errorMessage: snapshot.data.message,
                            onRetryPressed: () => groupListBloc.getGroups(),
                          );
                          break;
                      }
                    }
                    return null;
                  }
                ),
              ),
            ],
          )),
    );
  }

  _buildGroupItem(BuildContext context, ChatRoom groupData) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RoomChatPage(chatName: groupData.name, canChat: true, roomId: groupData.uuid,)),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: ListTile(
          leading: Container(
            width: 50.0,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(
                "https://res.cloudinary.com/psirius-eem/image/upload/v1612957194/media_mall/185d9c23-2f18-422c-b197-ddf26f6e4bbd.jpg",
              )),
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.blue
            ),
          ),
          title: Text(
            groupData.name,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.2,
              fontSize: 15.0,
            ),
            textAlign: TextAlign.left,
          ),
          subtitle: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  '${groupData.description}',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 13.0,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              Text(
                '10 Followers',
                style: TextStyle(
                  color: Theme.of(context).primaryColor.withOpacity(0.5),
                  fontWeight: FontWeight.w400,
                  fontSize: 14.0,
                  letterSpacing: 1.2,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
