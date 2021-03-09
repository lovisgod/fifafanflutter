import 'dart:async';
import 'package:fifafan/domain/group_list_response.dart';
import 'package:fifafan/domain/post_response_class.dart';
import 'package:fifafan/network/networking/ResponseHelper.dart';
import 'package:fifafan/repository/podcatListRepository.dart';
import 'package:flutter/cupertino.dart';

class PostListBloc {
  FifaRepository _postListRepository = FifaRepository();
  StreamController postListController =
      StreamController<Response<PostResponseClass>>();

  StreamSink<Response<PostResponseClass>> get getPostSink =>
      postListController.sink;

  Stream<Response<PostResponseClass>> get postListStream =>
      postListController.stream;

  StreamController userPostListController =
      StreamController<Response<PostResponseClass>>();

  StreamSink<Response<PostResponseClass>> get getUserPostSink =>
      userPostListController.sink;

  Stream<Response<PostResponseClass>> get userPostListStream =>
      userPostListController.stream;

  PodcastListBloc() {
//    postListController = StreamController<Response<PostResponseClass>>();
    _postListRepository = FifaRepository();
//    getPosts();
  }

  getPosts() async {
    debugPrint("this is getting here here here");
    getPostSink.add(Response.loading('Getting Post list.....'));
    try {
      PostResponseClass postResponseClass =
          await _postListRepository.getPosts();
      getPostSink.add(Response.completed(postResponseClass));
    } catch (e) {
      getPostSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  getUserPosts() async {
    debugPrint("this is getting here here here");
    getUserPostSink.add(Response.loading('Getting User post list.....'));
    try {
      PostResponseClass postResponseClass =
          await _postListRepository.getUserPosts();
      getUserPostSink.add(Response.completed(postResponseClass));
    } catch (e) {
      getPostSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    postListController?.close();
    userPostListController?.close();
  }
}
