import 'package:fifafan/ui/views/groups.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Groups(),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
