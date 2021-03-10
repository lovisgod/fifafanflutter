import 'package:fifafan/repository/podcatListRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:image_picker/image_picker.dart';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  FifaRepository fifaRepository = FifaRepository();
  String filename = "";
  TextEditingController postController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 40, left: 20),
              width: MediaQuery.of(context).size.width,
              child: Text(
                '${this.filename}',
                style: TextStyle(
                    fontSize: 20, color: Theme.of(context).primaryColor),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 120, left: 20, right: 20),
              width: MediaQuery.of(context).size.width,
              child: TextField(
                controller: postController,
                maxLines: 9,
                decoration: InputDecoration(
                  hintText: "Speak your mind",
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, right: 20),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      _uploadPicture();
                    },
                    child: Container(
                      width: 25.0,
                      height: 25.0,
                      child: Icon(Icons.photo_camera),
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                if (filename.isNotEmpty) {
                  fifaRepository.uploadPost(
                    this.filename,
                    postController.text.toString(),
                  );
                }
              },
              child: Align(
                alignment: Alignment.bottomCenter,
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
                      'Proceed',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _udateFileName(String name) {
    this.setState(() {
      this.filename = name;
    });
    debugPrint('this is file${this.filename}');
  }

  _uploadPicture() async {
    var file = await ImagePicker.pickImage(source: ImageSource.gallery);
    _udateFileName(file.path);
  }
}
