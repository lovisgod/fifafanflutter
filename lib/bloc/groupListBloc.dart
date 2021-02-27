import 'dart:async';
import 'package:fifafan/domain/group_list_response.dart';
import 'package:fifafan/domain/post_response_class.dart';
import 'package:fifafan/network/networking/ResponseHelper.dart';
import 'package:fifafan/repository/podcatListRepository.dart';
import 'package:flutter/cupertino.dart';

class GroupListBloc {
  FifaRepository _postListRepository = FifaRepository();

  StreamController groupListController =
      StreamController<Response<GroupListResponse>>();

  StreamSink<Response<GroupListResponse>> get groupListSink =>
      groupListController.sink;

  Stream<Response<GroupListResponse>> get groupListStream =>
      groupListController.stream;

  GroupListBloc() {
    groupListController = StreamController<Response<GroupListResponse>>();
    _postListRepository = FifaRepository();
    getGroups();
  }

  getGroups() async {
    groupListSink.add(Response.loading('Getting groups list.....'));
    try {
      GroupListResponse groupListResponse =
          await _postListRepository.getGroups();
      groupListSink.add(Response.completed(groupListResponse));
    } catch (e) {
      groupListSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    groupListController?.close();
  }
}
