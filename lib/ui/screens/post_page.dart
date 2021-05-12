import 'package:sportfan/bloc/fifauserBloc.dart';
import 'package:sportfan/bloc/podcastListBloc.dart';
import 'package:sportfan/data/fifafancontroller.dart';
import 'package:sportfan/domain/group_list_response.dart';
import 'package:sportfan/domain/post_response_class.dart';
import 'package:sportfan/network/networking/ResponseHelper.dart';
import 'package:sportfan/ui/screens/login.dart';
import 'package:sportfan/ui/views/groups.dart';
import 'package:sportfan/ui/views/loading.dart';
import 'package:sportfan/ui/views/error.dart';
import 'package:sportfan/ui/views/post_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  PostListBloc _bloc = PostListBloc();
  GroupListBloc groupListBloc = GroupListBloc();
  FifaController _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    _controller.setupSocket();
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
