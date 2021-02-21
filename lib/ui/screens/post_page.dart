import 'package:fifafan/data/fifafancontroller.dart';
import 'package:fifafan/domain/post_response_class.dart';
import 'package:fifafan/ui/views/groups.dart';
import 'package:fifafan/ui/views/post_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fifafan/domain/post.dart';

class PostPage extends StatelessWidget {
  final FifaController controller = Get.put(FifaController());
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
            child: Obx(() => Column(
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
                          itemCount: this.controller.postListData != null
                              ? this.controller.postListData.length
                              : 2,
                          itemBuilder: (BuildContext context, int index) {
                            Data post = this.controller.postListData[index];
                            print(post);
                            return GestureDetector(
                              onTap: () {},
                              child: PostItemView(
                                post: post,
                              ),
                            );
                          }),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
