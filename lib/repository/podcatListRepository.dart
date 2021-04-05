import 'package:fifafan/domain/get_user_group_response.dart';
import 'package:fifafan/domain/group_list_response.dart';
import 'package:fifafan/domain/list_follower_response.dart';
import 'package:fifafan/domain/post_response_class.dart';
import 'package:fifafan/domain/user_profile.dart';
import 'package:fifafan/domain/view_user_response.dart';
import 'package:fifafan/providers/podcastProvider.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class FifaRepository {
  FifaProvider provider = FifaProvider();
  Future<PostResponseClass> getPosts() async {
    final response = await provider.getPosts();
    return PostResponseClass.fromJson(response);
  }

  Future<PostResponseClass> getUserPosts() async {
    final response = await provider.getUserPosts();
    return PostResponseClass.fromJson(response);
  }

  Future<GroupListResponse> getGroups() async {
    final response = await provider.getGroups();
    return GroupListResponse.fromJson(response);
  }

  Future<GetUserGroupResponse> getUserGroups() async {
    final response = await provider.getUserGroups();
    return GetUserGroupResponse.fromJson(response);
  }

  Future<User> getUser() async {
    final response = await provider.getUser();
    return UserProfile.fromJson(response).data;
  }

  Future<ListFollowerResponse> getFollower() async {
    final response = await provider.getFollower();
    return ListFollowerResponse.fromJson(response);
  }

  Future<ViewdUser> viewUser(String userid) async {
    final response = await provider.viewUser(userid);
    return ViewUserResponse.fromJson(response).data.user;
  }

  uploadPost(String name, String postBody) async {
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
    final response = await provider.uploadPosts(name, postBody);
    debugPrint(response.toString());
    return response;
  }

  likePost(String postId, String like) async {
    final response = await provider.likePost(postId, like);
    debugPrint(response.toString());
    return response;
  }

  dislikePost(String postId) async {
    final response = await provider.unlikePost(postId);
    debugPrint(response.toString());
    return response;
  }


  commentPost(String postId, String body) async {
    final response = await provider.commentPost(postId, body);
    debugPrint(response.toString());
    return response;
  }

  followUser(String userId) async {
    final response = await provider.followUser(userId);
    debugPrint(response.toString());
    return response;
  }

  unfollowUser(String userId) async {
    final response = await provider.unfollowUser(userId);
    debugPrint(response.toString());
    return response;
  }

  createGroup(String name, String desc) async {
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
    final response = await provider.createGroup(name, desc);
    debugPrint(response.toString());
    return response;
  }

  updateProfile(String name,
      String phone,
      String address,
      String club,
      String gender,
      String shortBio,
      String favouriteQuotes,
      String language,
      String website,
     {String filePath = ""} ) async {
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
    final response = await provider.updateProfile(name,
        phone,
        address,
        club,
        gender,
        shortBio,
        favouriteQuotes,
        language,
        website,
        filePath: filePath);
    debugPrint(response.toString());
    return response;
  }
}
