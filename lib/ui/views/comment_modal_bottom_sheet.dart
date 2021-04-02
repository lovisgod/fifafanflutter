import 'package:flutter/material.dart';
import 'package:fifafan/repository/podcatListRepository.dart';
import 'package:fifafan/ui/views/flushAlert.dart';


openBottomSheet(BuildContext context, String postId) {
  FifaRepository fifaRepository = FifaRepository();
  TextEditingController commentController = TextEditingController();
  return showModalBottomSheet<void>(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        height: 200,
        width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top:20, left: 20, right: 20),
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  controller: commentController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: "input your comment",
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  // make comment
                  makeComment(postId, commentController.text.toString(),
                      fifaRepository, context);
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10, right: 20, left: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Center(
                    child: Text(
                      'Submit Comment',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
      );
    },
  );
}

makeComment(String postId, String body, FifaRepository repository, BuildContext context) async{
   var res = await repository.commentPost(postId, body);
   print(res);
   if (res != 200) {
     FlushAlert.show(
       context: context,
       message: 'operation not successful, please try again',
       isError: true,
     );
   } else {
     print("this is coming here comment");
     FlushAlert.show(
       context: context,
       message: 'We added your voice 🕺',
       isError: false,
     );
   }
}
