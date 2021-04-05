import 'package:fifafan/network/url.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';

class ApiClient {
  static String getToken() {
    var prefs = GetStorage();
    var token = prefs.read('token');
    return token.toString();
  }

  static Future<http.Response> getPosts() {
    return http.get(Endpoint.baseUrl + Endpoint.getposts,
        headers: {"Authorization": "Bearer ${getToken()}"});
  }

  static  likePost(String postid, String like) async {
    var queryParameters = {
      'post_uuid': postid,
      'like': like
    };
    var uri = Uri.https(Endpoint.host, '${Endpoint.path}${Endpoint.likePost}', queryParameters);
    print(uri);
    var res =  await http.patch(uri,
        headers: {"Authorization": "Bearer ${getToken()}"});
    return res.statusCode;
  }

  static  commentPost(String postid, String body) async {
    var uri = Uri.https(Endpoint.host, '${Endpoint.path}${Endpoint.commentPost}');
    print(uri);
    var res =  await http.patch(uri,
        headers: {"Authorization": "Bearer ${getToken()}"},
        body: {
          "post_uuid": postid,
          "comment": body
        });
    return res.statusCode;
  }



  static  unlikePost(String postid) async {
    var queryParameters = {
      'post_uuid': postid,
    };
    var uri = Uri.https(Endpoint.host, '${Endpoint.path}${Endpoint.unlikePost}', queryParameters);
    print(uri);
    var res =  await http.patch(uri,
        headers: {"Authorization": "Bearer ${getToken()}"});
    return res.statusCode;
  }

  static Future<http.Response> getUserPosts() {
    return http.get(Endpoint.baseUrl + Endpoint.getUserposts,
        headers: {"Authorization": "Bearer ${getToken()}"});
  }

  static Future<http.Response> getGroups() {
    return http.get(Endpoint.baseUrl + Endpoint.getGroups,
        headers: {"Authorization": "Bearer ${getToken()}"});
  }

  static Future<http.Response> getUserGroups() {
    return http.get(Endpoint.baseUrl + Endpoint.getUserGroups,
        headers: {"Authorization": "Bearer ${getToken()}"});
  }

  static Future<http.Response> getUser() {
    return http.get(Endpoint.baseUrl + Endpoint.getUser,
        headers: {"Authorization": "Bearer ${getToken()}"});
  }

  static Future<http.Response> getFollower() {
    return http.get(Endpoint.baseUrl + Endpoint.listFollowers,
        headers: {"Authorization": "Bearer ${getToken()}"});
  }

  static Future<http.Response> viewUser(String userid) {
    var queryParameters = {
      'user_uuid': userid,
    };
    var uri = Uri.https(Endpoint.host, '${Endpoint.path}${Endpoint.viewUser}', queryParameters);
    print(uri);
    var res = http.get(uri,
        headers: {"Authorization": "Bearer ${getToken()}"});
    return res;
  }

  static uploadImage(String name, String postBody) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse(Endpoint.baseUrl + Endpoint.createPost));
    request.files.add(await http.MultipartFile.fromPath('file', name));
    request.fields['post'] = postBody;
    request.headers['Authorization'] = '${getToken()}';
    var res = await request.send();
    return res.statusCode;
  }

  static  followUser(String userId) async {
    var queryParameters = {
      'user_uuid': userId
    };
    var uri = Uri.https(Endpoint.host, '${Endpoint.path}${Endpoint.followUser}', queryParameters);
    print(uri);
    var res =  await http.post(uri,
        headers: {"Authorization": "Bearer ${getToken()}"});
    return res.statusCode;
  }

  static  unfollowUser(String userId) async {
    var queryParameters = {
      'user_uuid': userId
    };
    var uri = Uri.https(Endpoint.host, '${Endpoint.path}${Endpoint.unfollowUser}', queryParameters);
    print(uri);
    var res =  await http.patch(uri,
        headers: {"Authorization": "Bearer ${getToken()}"});
    return res.statusCode;
  }

  static  createGroup(String name, String desc) async {
    var uri = Uri.https(Endpoint.host, '${Endpoint.path}${Endpoint.createGroup}');
    print(uri);
    var res =  await http.post(uri,
        headers: {"Authorization": "Bearer ${getToken()}"},
        body: {
          "groupname": name,
          "description": desc
        });
    return res.statusCode;
  }

  static updateProfile(String name,
      String phone,
      String address,
      String club,
      String gender,
      String shortBio,
      String favouriteQuotes,
      String language,
      String website,
      {String filePath = ""}) async {
    var request = http.MultipartRequest(
        'PATCH', Uri.parse(Endpoint.baseUrl + Endpoint.updateProfile));
    if (filePath.isNotEmpty) {
      request.files.add(await http.MultipartFile.fromPath('file', filePath));
    }
    if (name.isNotEmpty) {
      request.fields['name'] = name;
    }
    if (phone.isNotEmpty) {
      request.fields['phone'] = phone;
    }
    if (address.isNotEmpty) {
      request.fields['address'] = address;
    }
    if (club.isNotEmpty) {
      request.fields['club'] = club;
    }
    if (gender.isNotEmpty) {
      request.fields['gender'] = gender;
    }
    if (shortBio.isNotEmpty) {
      request.fields['shortBio'] = shortBio;
    }
    if (favouriteQuotes.isNotEmpty) {
      request.fields['favoriteQuote'] = favouriteQuotes;
    }
    if (language.isNotEmpty) {
      request.fields['language'] = language;
    }
    if (website.isNotEmpty) {
      request.fields['website'] = website;
    }
    request.headers['Authorization'] = '${getToken()}';
    var res = await request.send();
    return res.statusCode;
  }
}
