import 'dart:async';
import 'package:fifafan/domain/group_list_response.dart';
import 'package:fifafan/domain/post_response_class.dart';
import 'package:fifafan/network/networking/ResponseHelper.dart';
import 'package:fifafan/repository/podcatListRepository.dart';
import 'package:flutter/cupertino.dart';

class PostListBloc {
  FifaRepository _postListRepository = FifaRepository();
  StreamController postListController =
      StreamController<FifaResponseResponse<PostResponseClass>>();

  StreamSink<FifaResponseResponse<PostResponseClass>> get getPostSink =>
      postListController.sink;

  Stream<FifaResponseResponse<PostResponseClass>> get postListStream =>
      postListController.stream;

  StreamController userPostListController =
      StreamController<FifaResponseResponse<PostResponseClass>>();

  StreamSink<FifaResponseResponse<PostResponseClass>> get getUserPostSink =>
      userPostListController.sink;

  Stream<FifaResponseResponse<PostResponseClass>> get userPostListStream =>
      userPostListController.stream;

  PodcastListBloc() {
//    postListController = StreamController<Response<PostResponseClass>>();
    _postListRepository = FifaRepository();
//    getPosts();
  }

  getPosts() async {
    debugPrint("this is getting here here here");
    getPostSink.add(FifaResponseResponse.loading('Getting Post list.....'));
    try {
      PostResponseClass postResponseClass =
          await _postListRepository.getPosts();
      getPostSink.add(FifaResponseResponse.completed(postResponseClass));
    } catch (e) {
      getPostSink.add(FifaResponseResponse.error(e.toString()));
      print(e);
    }
  }

  getUserPosts() async {
    debugPrint("this is getting here here here");
    getUserPostSink.add(FifaResponseResponse.loading('Getting User post list.....'));
    try {
      PostResponseClass postResponseClass =
          await _postListRepository.getUserPosts();
      getUserPostSink.add(FifaResponseResponse.completed(postResponseClass));
    } catch (e) {
      getPostSink.add(FifaResponseResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    postListController?.close();
    userPostListController?.close();
  }
}
