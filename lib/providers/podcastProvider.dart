import 'dart:io';

import 'package:sportfan/network/networking/CustomException.dart';
import 'package:sportfan/network/networking/client.dart';
import 'package:sportfan/network/networking/response.dart';

class FifaProvider {
  Future getPosts() async {
    var responseJson;
    try {
      final response = await ApiClient.getPosts();
      responseJson = ResponseHandler().response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future getUserPosts() async {
    var responseJson;
    try {
      final response = await ApiClient.getUserPosts();
      responseJson = ResponseHandler().response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future getGroups() async {
    var responseJson;
    try {
      final response = await ApiClient.getGroups();
      responseJson = ResponseHandler().response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future getUserGroups() async {
    var responseJson;
    try {
      final response = await ApiClient.getUserGroups();
      responseJson = ResponseHandler().response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future getUser() async {
    var responseJson;
    try {
      final response = await ApiClient.getUser();
      responseJson = ResponseHandler().response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }


  Future getFollower() async {
    var responseJson;
    try {
      final response = await ApiClient.getFollower();
      responseJson = ResponseHandler().response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future viewUser(String userid) async {
    var responseJson;
    try {
      final response = await ApiClient.viewUser(userid);
      responseJson = ResponseHandler().response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  uploadPosts(String name, String postBody) async {
    var responseJson;
    try {
      final response = await ApiClient.uploadImage(name, postBody);
     // responseJson = ResponseHandler().response(response);
      responseJson = response;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  likePost(String postId, String like) async {
    var responseJson;
    try {
      final response = await ApiClient.likePost(postId, like);
      // responseJson = ResponseHandler().response(response);
      responseJson = response;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  unlikePost(String postId) async {
    var responseJson;
    try {
      final response = await ApiClient.unlikePost(postId);
      // responseJson = ResponseHandler().response(response);
      responseJson = response;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  commentPost(String postId, String body) async {
    var responseJson;
    try {
      final response = await ApiClient.commentPost(postId, body);
      // responseJson = ResponseHandler().response(response);
      responseJson = response;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  followUser(String userId) async {
    var responseJson;
    try {
      final response = await ApiClient.followUser(userId);
      // responseJson = ResponseHandler().response(response);
      responseJson = response;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  unfollowUser(String userId) async {
    var responseJson;
    try {
      final response = await ApiClient.unfollowUser(userId);
      // responseJson = ResponseHandler().response(response);
      responseJson = response;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  createGroup(String name, String desc) async {
    var responseJson;
    try {
      final response = await ApiClient.createGroup(name, desc);
      // responseJson = ResponseHandler().response(response);
      responseJson = response;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
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
      {String filePath = ""}) async {
    var responseJson;
    try {
      final response = await ApiClient.updateProfile(name,
          phone,
          address,
          club,
          gender,
          shortBio,
          favouriteQuotes,
          language,
          website,
          filePath: filePath);
      // responseJson = ResponseHandler().response(response);
      responseJson = response;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future getGroupPost(String groupId) async {
    var responseJson;
    try {
      final response = await ApiClient.getGroupPosts(groupId);
      responseJson = ResponseHandler().response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future getPersonalMessages(String follower_uuid) async {
    var responseJson;
    try {
      final response = await ApiClient.getPersonalMessages(follower_uuid);
      responseJson = ResponseHandler().response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }
}
