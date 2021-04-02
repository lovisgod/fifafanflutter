import 'package:fifafan/bloc/groupListBloc.dart';
import 'package:fifafan/domain/user_profile.dart';
import 'package:fifafan/ui/screens/createPost.dart';
import 'package:flutter/material.dart';
import 'package:fifafan/bloc/podcastListBloc.dart';
import 'package:fifafan/domain/post_response_class.dart';
import 'package:fifafan/network/networking/ResponseHelper.dart';
import 'package:fifafan/ui/views/loading.dart';
import 'package:fifafan/ui/views/error.dart';
import 'package:fifafan/ui/views/post_item.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  PostListBloc _bloc = PostListBloc();
  GroupListBloc _groupListBloc = GroupListBloc();
  bool isLoadedPosts = false;
  @override
  Widget build(BuildContext context) {
    _groupListBloc.getUser();
    _bloc.getUserPosts();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreatePost()),
          );
        },
        child: Icon(Icons.create),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            StreamBuilder<FifaResponseResponse<User>>(
                stream: _groupListBloc.userProfileStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    switch (snapshot.data.status) {
                      case Status.LOADING:
//                        return Loading(
//                          loadingMessage: snapshot.data.message,
//                        );
                        break;
                      case Status.COMPLETED:
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
                                        "https://res.cloudinary.com/psirius-eem/image/upload/v1612957194/media_mall/185d9c23-2f18-422c-b197-ddf26f6e4bbd.jpg"),
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
                                        fontSize: 18.0,
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
                                ],
                              )
                            ],
                          ),
                        );
                        break;
                      case Status.ERROR:
                        return Error(
                          errorMessage: snapshot.data.message,
                          onRetryPressed: () => {},
                        );
                        break;
                    }
                  }
                  return Container();
                }),
            Expanded(
              child: Container(
                child: StreamBuilder<FifaResponseResponse<PostResponseClass>>(
                  stream: _bloc.userPostListStream,
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
                                  post: snapshot.data.data.data[index],
                                  isFromViewProfile: false,
                                ),
                              );
                            },
                            itemCount: snapshot.data.data.data.length,
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
}
