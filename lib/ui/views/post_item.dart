import 'package:sportfan/domain/post.dart';
import 'package:sportfan/domain/post_response_class.dart';
import 'package:sportfan/ui/screens/viewUserProfile.dart';
import 'package:sportfan/utils/timer.dart';
import 'package:sportfan/repository/podcatListRepository.dart';
import 'package:sportfan/ui/views/flushAlert.dart';
import 'package:flutter/material.dart';
import 'package:sportfan/ui/screens/post_details.dart';

class PostItemView extends StatefulWidget {
  PostData post;
  bool isFromViewProfile;
  PostItemView({this.post, this.isFromViewProfile});

  @override
  _PostItemViewState createState() => _PostItemViewState();
}

class _PostItemViewState extends State<PostItemView> {
  FifaRepository fifaRepository = FifaRepository();
  int likes = 0;
  PostData post;
  @override
  void initState() {
    post = this.widget.post;
    likes = post.likes.length;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 10.0),
                  child: Container(
                    alignment: Alignment.center,
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            post.media.toString(),
                          ),
                        ),
                        borderRadius: BorderRadius.circular(100.0)),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        if (!this.widget.isFromViewProfile) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ViewUserProfile(userId: this.widget.post.userUuid, userName: this.widget.post.ownerName,)),
                          );
                        }
                      },
                      child: Text(
                        post.ownerName.toString(),
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      MyTimer()
                          .duration(DateTime.parse(post.createdAt))
                          .toString(),
                      style: TextStyle(
                          color: Color(0xFFC4C4C4),
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 15.0),
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: Text(
                post.post,
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
              ),
            ),
            SizedBox(height: 15.0),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: FittedBox(
                fit: BoxFit.fill,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.network(
                    post.media.toString(),
                    height: 300.0,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      increaseCount(post.uuid);
                    },
                    child: Container(
                      width: 35.0,
                      height: 35.0,
                      child: Icon(
                        Icons.thumb_up,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      decreaseCount(post.uuid);
                    },
                    child: Container(
                      width: 35.0,
                      height: 35.0,
                      child: Icon(
                        Icons.thumb_down,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      gotoComment(post, context);
                    },
                    child: Container(
                      width: 35.0,
                      height: 35.0,
                      child: Icon(
                        Icons.add_comment,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Text(
                    '${this.likes} likes',
//                    '0 likes',
                    style: TextStyle(
                        color: Colors.black87, fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  gotoComment(PostData post, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PostDetails(post: post)),
    );
  }

  increaseCount(String postId) async{
    debugPrint('getting here');
    setState(() {
      likes += 1;
    });
    var res = await fifaRepository.likePost(postId, 'liked');
    if (res != 200) {
      FlushAlert.show(
        context: context,
        message: 'operation not successful, please try again',
        isError: true,
      );
      setState(() {
        likes -= 1;
      });
    } else {
      FlushAlert.show(
        context: context,
        message: 'Post Liked!!!',
        isError: false,
      );
    }

    debugPrint("${this.likes}");
  }

  decreaseCount(String postId) async {
    debugPrint('getting here');
    setState(() {
      likes -= 1;
    });
    var res = await fifaRepository.dislikePost(postId);
    if (res != 200) {
      FlushAlert.show(
        context: context,
        message: 'operation not successful, please try again',
        isError: true,
      );
      setState(() {
        likes += 1;
      });
    } else {
      FlushAlert.show(
        context: context,
        message: 'Post Un-Liked!!!',
        isError: false,
      );
    }

    debugPrint("${this.likes}");
  }
}
