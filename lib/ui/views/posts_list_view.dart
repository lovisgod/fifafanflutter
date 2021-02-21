import 'package:fifafan/domain/groupModel.dart';
import 'package:fifafan/domain/post.dart';
import 'package:fifafan/domain/post_response_class.dart';
import 'package:flutter/material.dart';
import 'post_item.dart';
import 'package:get/get.dart';

class PostListView extends StatelessWidget {
  final List<Data> posts;

  PostListView({this.posts});

  @override
  Widget build(BuildContext context) {
    return Column(
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
          child: ListView.builder(
              padding: EdgeInsets.only(left: 10.0),
              scrollDirection: Axis.vertical,
              itemCount: this.posts != null ? this.posts.length : 2,
              itemBuilder: (BuildContext context, int index) {
                Data post = posts[index];
                return GestureDetector(
                  onTap: () {},
                  child: PostItemView(
                    post: post,
                  ),
                );
              }),
        )
      ],
    );
  }
}
