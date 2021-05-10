import 'package:fifafan/bloc/fifauserBloc.dart';
import 'package:fifafan/bloc/podcastListBloc.dart';
import 'package:fifafan/domain/group_list_response.dart';
import 'package:fifafan/domain/post_response_class.dart';
import 'package:fifafan/network/networking/ResponseHelper.dart';
import 'package:fifafan/ui/screens/login.dart';
import 'package:fifafan/ui/views/groups.dart';
import 'package:fifafan/ui/views/loading.dart';
import 'package:fifafan/ui/views/error.dart';
import 'package:fifafan/ui/views/post_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  PostListBloc _bloc = PostListBloc();
  GroupListBloc groupListBloc = GroupListBloc();
  @override
  Widget build(BuildContext context) {
    _bloc = PostListBloc();
    _bloc.getPosts();
    groupListBloc.getGroups();
    return Scaffold(
      body: Column(
        children: <Widget>[
          StreamBuilder<FifaResponseResponse<GroupListResponse>>(
            stream: groupListBloc.groupListStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                switch (snapshot.data.status) {
                  case Status.LOADING:
                    return Loading(loadingMessage: snapshot.data.message);
                    break;
                  case Status.COMPLETED:
                    return Groups(
                      groups: snapshot.data.data.data.data,
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
              return Container(height: 0, width: 0,);
            },
          ),
          SizedBox(
            height: 1.0,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
//              Padding(
//                padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 20.0),
//                child: Text(
//                  'Posts',
//                  style: TextStyle(
//                    fontSize: 24.0,
//                    fontWeight: FontWeight.bold,
//                    letterSpacing: 2.0,
//                  ),
//                ),
//              ),
              Expanded(
                child: Container(
                  height: 400.0,
                  child: StreamBuilder<FifaResponseResponse<PostResponseClass>>(
                    stream: _bloc.postListStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        switch (snapshot.data.status) {
                          case Status.LOADING:
                            return Loading(loadingMessage: snapshot.data.message);
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
                            if (snapshot.data.message.contains('500')) {
                              // Navigator.pushReplacement(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => Login())
                              // );
                              Get.off('/auth/login');
                            }
                            return Error(
                              errorMessage: snapshot.data.message,
                              onRetryPressed: () => _bloc.getPosts(),
                            );
                            break;
                        }
                      }
                      return Container(height: 0, width: 0,);
                    },
                  ),
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}

class FifaPostPage extends StatelessWidget {
  PostListBloc _bloc;
  @override
  Widget build(BuildContext context) {
    _bloc = PostListBloc();
  }
}
