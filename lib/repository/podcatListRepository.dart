import 'package:fifafan/domain/group_list_response.dart';
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

  Future<User> getUser() async {
    final response = await provider.getUser();
    return UserProfile.fromJson(response).data;
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
}
