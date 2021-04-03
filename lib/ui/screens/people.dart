import 'package:fifafan/bloc/fifauserBloc.dart';
import 'package:fifafan/domain/list_follower_response.dart';
import 'package:fifafan/network/networking/ResponseHelper.dart';
import 'package:fifafan/repository/podcatListRepository.dart';
import 'package:fifafan/ui/screens/single_user_chat_page.dart';
import 'package:fifafan/ui/screens/viewUserProfile.dart';
import 'package:flutter/material.dart';
import 'package:fifafan/ui/views/loading.dart';
import 'package:fifafan/ui/views/error.dart';

class People extends StatefulWidget {
  @override
  _PeopleState createState() => _PeopleState();
}

class _PeopleState extends State<People> {
  TextEditingController search_view = TextEditingController();
  FifaRepository fifaRepository = FifaRepository();
  GroupListBloc groupListBloc = GroupListBloc();

  @override
  Widget build(BuildContext context) {
    groupListBloc.getFollowers();
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
                hintText: "Search for a user",
                hintStyle: new TextStyle(color: Colors.grey[300]),
              ),
              textAlign: TextAlign.center,
            ),
          ),
              SizedBox(height: 10,),
              Text(
                'List of friends',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Expanded(
                child: StreamBuilder<FifaResponseResponse<ListFollowerResponse>>(
                    stream: groupListBloc.followerListStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        switch (snapshot.data.status) {
                          case Status.LOADING:
                            return Loading(loadingMessage: snapshot.data.message);
                            break;
                          case Status.COMPLETED:

                            return RefreshIndicator(
                              onRefresh: () {
                                return groupListBloc.getFollowers();
                              },
                              child: ListView.separated(
                                itemBuilder: (BuildContext context, int index) {
                                  return _buildCartItem(context, snapshot.data.data.data[index].follower, snapshot.data.data.data[index].user);
                                },
                                separatorBuilder: (BuildContext context, int index) {
                                  return Divider(
                                    height: 1.0,
                                    color: Colors.grey,
                                  );
                                },
                                itemCount: snapshot.data.data.data.length,
                              ),
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

  _buildCartItem(BuildContext context, Follower follower, FolloweResponseUserData userData) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ViewUserProfile(userId: follower.uuid, userName: follower.name,)),
          );
        },
        child: ListTile(
          leading: Container(
            width: 50.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://res.cloudinary.com/psirius-eem/image/upload/v1612957194/media_mall/185d9c23-2f18-422c-b197-ddf26f6e4bbd.jpg"
                  ),
                ),
                borderRadius: BorderRadius.circular(30.0), color: Colors.grey),
          ),
          title: Text(
            follower.name,
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
              Text(
                '${follower.club} ${follower.status}',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 13.0,
                  letterSpacing: 1.2,
                ),
              ),
              SizedBox(width: 10,),
              Text(
                '0 Followers',
                style: TextStyle(
                  color: Theme.of(context).primaryColor.withOpacity(0.5),
                  fontWeight: FontWeight.w400,
                  fontSize: 14.0,
                  letterSpacing: 1.2,
                ),
              ),
              SizedBox(width: 10,),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        ChatWithFriend(
                          userId: userData.uuid,
                          chatName: follower.name,
                          canChat: true,)
                    ),
                  );
                },
                child: Container(
                  width: 35.0,
                  height: 35.0,
                  child: Icon(
                    Icons.message,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
