import 'dart:async';
import 'package:fifafan/domain/get_user_group_response.dart';
import 'package:fifafan/domain/group_list_response.dart';
import 'package:fifafan/domain/list_follower_response.dart';
import 'package:fifafan/domain/post_response_class.dart';
import 'package:fifafan/domain/user_profile.dart';
import 'package:fifafan/domain/view_user_response.dart';
import 'package:fifafan/network/networking/ResponseHelper.dart';
import 'package:fifafan/repository/podcatListRepository.dart';
import 'package:flutter/cupertino.dart';

class GroupListBloc {
  FifaRepository _postListRepository = FifaRepository();

  StreamController groupListController =
      StreamController<FifaResponseResponse<GroupListResponse>>();

  StreamController followerListController =
  StreamController<FifaResponseResponse<ListFollowerResponse>>();

  StreamController userGroupListController = StreamController<FifaResponseResponse<GetUserGroupResponse>>();

  StreamController userProfileController = StreamController<FifaResponseResponse<User>>();

  StreamController viewUserProfileController = StreamController<FifaResponseResponse<ViewdUser>>();

  StreamController viewUserProfilePostController = StreamController<FifaResponseResponse<List<Posts>>>();



  StreamSink<FifaResponseResponse<GroupListResponse>> get groupListSink =>
      groupListController.sink;

  Stream<FifaResponseResponse<GroupListResponse>> get groupListStream =>
      groupListController.stream;

  StreamSink<FifaResponseResponse<ListFollowerResponse>> get followerListSink =>
      followerListController.sink;

  Stream<FifaResponseResponse<ListFollowerResponse>> get followerListStream =>
      followerListController.stream;

  StreamSink<FifaResponseResponse<GetUserGroupResponse>> get userGroupListSink =>
      userGroupListController.sink;

  Stream<FifaResponseResponse<GetUserGroupResponse>> get userGroupListStream =>
      userGroupListController.stream;

  StreamSink<FifaResponseResponse<User>> get userProfileSink => userProfileController.sink;

  Stream<FifaResponseResponse<User>> get userProfileStream => userProfileController.stream;

  StreamSink<FifaResponseResponse<ViewdUser>> get viewUserProfileSink => viewUserProfileController.sink;

  Stream<FifaResponseResponse<ViewdUser>> get viewUserProfileStream => viewUserProfileController.stream;

  StreamSink<FifaResponseResponse<List<Posts>>> get viewUserProfilePostSink => viewUserProfilePostController.sink;

  Stream<FifaResponseResponse<List<Posts>>> get viewUserProfilePostStream => viewUserProfilePostController.stream;

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


  getUserGroups() async {
    userGroupListSink.add(FifaResponseResponse.loading('Getting groups list.....'));
    try {
      GetUserGroupResponse groupListResponse = await _postListRepository.getUserGroups();
      userGroupListSink.add(FifaResponseResponse.completed(groupListResponse));
    } catch (e) {
      userGroupListSink.add(FifaResponseResponse.error(e.toString()));
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

  getFollowers() async {
    followerListSink.add(FifaResponseResponse.loading('Fetching follower profile....'));
    try {
      ListFollowerResponse followerResponse = await _postListRepository.getFollower();
      followerListSink.add(FifaResponseResponse.completed(followerResponse));
    } catch (e) {
      followerListSink.add(FifaResponseResponse.error(e.toString()));
      print(e);
    }
  }

  viewUser(String userid) async {
    viewUserProfileSink.add(FifaResponseResponse.loading('Fetching user profile....'));
    viewUserProfilePostSink.add(FifaResponseResponse.loading('Fetching post'));
    try {
      ViewdUser user = await _postListRepository.viewUser(userid);
      viewUserProfileSink.add(FifaResponseResponse.completed(user));
      viewUserProfilePostSink.add(FifaResponseResponse.completed(user.posts));
    } catch (e) {
      viewUserProfileSink.add(FifaResponseResponse.error(e.toString()));
      viewUserProfilePostSink.add(FifaResponseResponse.error(e.toString()));
      print(e);
    }
  }

  updateFollowed(ViewdUser user) {
    viewUserProfileSink.add(FifaResponseResponse.completed(user, isPerformedOperation: true));
  }

  dispose() {
    groupListController?.close();
    userProfileController?.close();
    viewUserProfileController?.close();
    viewUserProfilePostController?.close();
    userGroupListController?.close();
    followerListController?.close();
  }
}
