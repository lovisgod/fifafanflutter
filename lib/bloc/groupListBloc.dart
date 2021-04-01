import 'dart:async';
import 'package:fifafan/domain/group_list_response.dart';
import 'package:fifafan/domain/post_response_class.dart';
import 'package:fifafan/domain/user_profile.dart';
import 'package:fifafan/network/networking/ResponseHelper.dart';
import 'package:fifafan/repository/podcatListRepository.dart';
import 'package:flutter/cupertino.dart';

class GroupListBloc {
  FifaRepository _postListRepository = FifaRepository();

  StreamController groupListController =
      StreamController<FifaResponseResponse<GroupListResponse>>();

  StreamController userProfileController = StreamController<FifaResponseResponse<User>>();

  StreamSink<FifaResponseResponse<GroupListResponse>> get groupListSink =>
      groupListController.sink;

  Stream<FifaResponseResponse<GroupListResponse>> get groupListStream =>
      groupListController.stream;

  StreamSink<FifaResponseResponse<User>> get userProfileSink => userProfileController.sink;

  Stream<FifaResponseResponse<User>> get userProfileStream => userProfileController.stream;

  GroupListBloc() {
//    groupListController = StreamController<Response<GroupListResponse>>();
    _postListRepository = FifaRepository();
//    getGroups();
  }

  getGroups() async {
    groupListSink.add(FifaResponseResponse.loading('Getting groups list.....'));
    try {
      GroupListResponse groupListResponse =
          await _postListRepository.getGroups();
      groupListSink.add(FifaResponseResponse.completed(groupListResponse));
    } catch (e) {
      groupListSink.add(FifaResponseResponse.error(e.toString()));
      print(e);
    }
  }

  getUser() async {
    userProfileSink.add(FifaResponseResponse.loading('Fetching user profile....'));
    try {
      User user = await _postListRepository.getUser();
      userProfileSink.add(FifaResponseResponse.completed(user));
    } catch (e) {
      userProfileSink.add(FifaResponseResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    groupListController?.close();
    userProfileController?.close();
  }
}
