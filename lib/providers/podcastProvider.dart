import 'dart:io';

import 'package:fifafan/network/networking/CustomException.dart';
import 'package:fifafan/network/networking/client.dart';
import 'package:fifafan/network/networking/response.dart';

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
}
