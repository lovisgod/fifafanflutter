import 'package:sportfan/bloc/fifauserBloc.dart';
import 'package:sportfan/domain/user_profile.dart';
import 'package:sportfan/domain/view_user_response.dart';
import 'package:sportfan/repository/podcatListRepository.dart';
import 'package:sportfan/ui/views/flushAlert.dart';
import 'package:flutter/material.dart';
import 'package:sportfan/bloc/podcastListBloc.dart';
import 'package:sportfan/domain/post_response_class.dart';
import 'package:sportfan/network/networking/ResponseHelper.dart';
import 'package:sportfan/ui/views/error.dart';
import 'package:sportfan/ui/views/post_item.dart';

class ViewUserProfile extends StatefulWidget {
  String userId;
  String userName;
  ViewUserProfile({this.userId, this.userName});
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<ViewUserProfile> {
  FifaRepository fifaRepository = FifaRepository();
  PostListBloc _bloc = PostListBloc();
  GroupListBloc _groupListBloc = GroupListBloc();
  bool isLoadedPosts = false;
  @override
  Widget build(BuildContext context) {
    _groupListBloc.viewUser(this.widget.userId);
    _bloc.getUserPosts();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${this.widget.userName}',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              letterSpacing: 2.0),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            StreamBuilder<FifaResponseResponse<ViewdUser>>(
                stream: _groupListBloc.viewUserProfileStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    switch (snapshot.data.status) {
                      case Status.LOADING:
//                        return Loading(
//                          loadingMessage: snapshot.data.message,
//                        );
                        break;
                      case Status.COMPLETED:
                        print(snapshot.data.data);
                        return Container(
                          height: 120.0,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(
                              top: 10.0, right: 15.0, left: 15.0),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(right: 10.0),
                                height: 100.0,
                                width: 100.0,
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                        width: 2.0,
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
                                    image: NetworkImage(
                                        getProfileurl(snapshot.data.data.profiles.length != 0 ?snapshot.data.data.profiles[0].profilePic : "")
                                        ),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '${snapshot.data.data.name}',
                                    style: TextStyle(
                                        fontSize: 13.0,
                                        color: Colors.black,
                                        letterSpacing: 1.2),
                                    textAlign: TextAlign.left,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Text(
                                        '${snapshot.data.data.club} ${snapshot.data.data.role}',
                                        style: TextStyle(
                                            fontSize: 10.0,
                                            color: Colors.black,
                                            letterSpacing: 1.2),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(right: 5.0),
                                          child: GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                              width: 20.0,
                                              height: 20.0,
                                              child: Icon(
                                                Icons.people_outline,
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 3.0, right: 10.0),
                                          child: Text(
                                            '26',
                                            style: TextStyle(
                                                color: Colors.black87, fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: 5.0),
                                          child: GestureDetector(
                                            onTap: () {
                                              follow(this.widget.userId,
                                                  snapshot.data.data.following ? false : true,
                                                  context,
                                                  snapshot.data.data);
                                            },
                                            child: Text(
                                              snapshot.data.data.following == true ? 'Un-Follow' : 'Follow',
                                              style: TextStyle(
                                                  color: Colors.black87, fontWeight: FontWeight.normal),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                        break;
                      case Status.ERROR:
                        return Error(
                          errorMessage: snapshot.data.message,
                          onRetryPressed: () => {
                            _groupListBloc.viewUser(this.widget.userId)
                          },
                        );
                        break;
                    }
                  }
                  return Container();
                }),
            Expanded(
              child: Container(
                child: StreamBuilder<FifaResponseResponse<List<Posts>>>(
                  stream: _groupListBloc.viewUserProfilePostStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      switch (snapshot.data.status) {
                        case Status.LOADING:
//                          return Loading(loadingMessage: snapshot.data.message);
                          break;
                        case Status.COMPLETED:
                          return ListView.builder(
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) =>
                                  //         PodcastPage(
                                  //             snapshot.data.data.podcasts[index]
                                  //         ),
                                  //   ),
                                  // );
                                },
                                child: PostItemView(
                                  post: snapshot.data.data[index].toPost(),
                                  isFromViewProfile: true,
                                ),
                              );
                            },
                            itemCount: snapshot.data.data.length,
                          );
                          break;
                        case Status.ERROR:
                          return Error(
                            errorMessage: snapshot.data.message,
                            onRetryPressed: () => _bloc.getUserPosts(),
                          );
                          break;
                      }
                    }
                    return Container();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _toggleLoaded() {
    setState(() {
      isLoadedPosts = true;
    });
  }

  void follow(String userId, bool follow, BuildContext context, ViewdUser user) async {
    var res = 0;
    print(follow);
    if (follow) {
      res = await fifaRepository.followUser(userId);
    } else {
     res = await fifaRepository.unfollowUser(userId);
    }

    if (res != 200) {
      await FlushAlert.show(context: context, message: 'operation not successful', isError: true, isDismisble: true);
    } else {
       ViewdUser newuser = ViewdUser(
         uuid: user.uuid,
           name: user.name,
           email: user.email,
           phone: user.phone,
           username: user.username,
           address: user.address,
           verified: user.verified,
           role: user.role,
           status: user.status,
           club: user.club,
           posts: user.posts,
           profiles: user.profiles, following: follow
       );
      _groupListBloc.updateFollowed(newuser);
      await FlushAlert.show(context: context, message: 'operation successful', isError: false, isDismisble: true);
    }

  }

  String getProfileurl(String url) {
    if (url != null) {
      return  url.isNotEmpty ? url :
      "https://res.cloudinary.com/psirius-eem/image/upload/v1612957194/media_mall/185d9c23-2f18-422c-b197-ddf26f6e4bbd.jpg";
    } else {
      return "https://res.cloudinary.com/psirius-eem/image/upload/v1612957194/media_mall/185d9c23-2f18-422c-b197-ddf26f6e4bbd.jpg";
    }
  }
}
