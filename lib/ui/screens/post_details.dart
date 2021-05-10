import 'package:flutter/material.dart';
import 'package:fifafan/ui/views/post_item.dart';
import 'package:fifafan/domain/post_response_class.dart';
import 'package:fifafan/ui/views/comment_modal_bottom_sheet.dart';
import 'package:fifafan/domain/comment_model.dart';



class PostDetails extends StatefulWidget {
  PostData post;
  PostDetails({this.post});
  @override
  _PostDetailsState createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${this.widget.post.post.substring(0, 10)}.....',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              letterSpacing: 2.0),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          child: Container(
            height: MediaQuery.of(context).size.height - 60,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  PostItemView(post:this.widget.post, isFromViewProfile: false),
                  Padding(
                    padding: const EdgeInsets.only(left:20.0),
                    child: Text(
                      'Comments',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      openBottomSheet(context, this.widget.post.uuid);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left:20.0, right: 20.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Center(
                          child: Text(
                            'Input your own comment here 👌',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Expanded(
                      child: ListView.separated(
                        itemBuilder: (BuildContext context, int index) {
                          return _buildCommentItem(context, this.widget.post.comment[index]);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider(
                            height: 1.0,
                            color: Colors.white,
                          );
                        },
                        itemCount: this.widget.post.comment.length,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  _buildCommentItem(BuildContext context, Comment_model comment) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: ListTile(
        leading: Container(
          width: 50.0,
          child: Image(
            image: NetworkImage(
                "https://res.cloudinary.com/psirius-eem/image/upload/v1612957194/media_mall/185d9c23-2f18-422c-b197-ddf26f6e4bbd.jpg"),
            color: Theme.of(context).primaryColor.withOpacity(0.5),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0), color: Colors.grey),
        ),
        title: Text(
          "${comment.userName}",
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
            Expanded(
              child: Text(
                '${comment.comment}',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 13.0,
                  letterSpacing: 1.2,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
