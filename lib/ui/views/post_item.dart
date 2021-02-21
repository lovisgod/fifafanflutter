import 'package:fifafan/domain/post.dart';
import 'package:fifafan/domain/post_response_class.dart';
import 'package:fifafan/utils/timer.dart';
import 'package:flutter/material.dart';

class PostItemView extends StatefulWidget {
  Data post;
  PostItemView({this.post});

  @override
  _PostItemViewState createState() => _PostItemViewState();
}

class _PostItemViewState extends State<PostItemView> {
  @override
  Widget build(BuildContext context) {
    Data post = this.widget.post;
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 10.0),
                  child: Container(
                    alignment: Alignment.center,
                    width: 35.0,
                    height: 35.0,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(100.0)),
                    child: Image.network(
                      post.media.toString(),
                      height: 35.0,
                      width: 35.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      post.ownerName.toString(),
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
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
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.network(
                post.media.toString(),
                height: 200.0,
                width: 300.0,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 10.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 35.0,
                      height: 35.0,
                      child: Icon(
                        Icons.favorite,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Text(
//                    '${post.likes.length} likes',
                    '0 likes',
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
}
