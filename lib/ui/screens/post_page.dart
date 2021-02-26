import 'package:fifafan/bloc/podcastListBloc.dart';
import 'package:fifafan/data/fifafancontroller.dart';
import 'package:fifafan/domain/post_response_class.dart';
import 'package:fifafan/network/networking/ResponseHelper.dart';
import 'package:fifafan/ui/views/groups.dart';
import 'package:fifafan/ui/views/loading.dart';
import 'package:fifafan/ui/views/error.dart';
import 'package:fifafan/ui/views/post_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fifafan/domain/post.dart';

class PostPage extends StatelessWidget {
  final FifaController controller = Get.put(FifaController());
  PostListBloc _bloc;
  @override
  Widget build(BuildContext context) {
    controller.getAllPosts();
    return Scaffold(
      body: Column(
        children: <Widget>[
          Groups(),
          SizedBox(
            height: 10.0,
          ),
          Expanded(
            child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                      child: Text(
                        'Posts',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                        ),
                      ),
                    ),
                    Container(
                      child: StreamBuilder<Response<PostResponseClass>>(
                        stream: _bloc.getPosts(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            switch (snapshot.data.status) {
                              case Status.LOADING:
                                return Loading(loadingMessage: snapshot.data.message);
                                break;
                              case Status.COMPLETED:
                                return ListView.builder(
                                  itemBuilder: (context, index){
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
                                      ),
                                    );
                                  },
                                  itemCount: snapshot.data.data.data.length,
                                );
                                break;
                              case Status.ERROR:
                                return Error(
                                  errorMessage: snapshot.data.message,
                                  onRetryPressed: () => _bloc.getPosts(),
                                );
                                break;
                            }
                          }
                          return Container();
                        },
                      ),
                    ),
                  ],
                )),
        ],
      ),
    );
  }
}
