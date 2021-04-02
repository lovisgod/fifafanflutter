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
    // var queryParameters = {
    //   'post_uuid': postid,
    //   'comment': body
    // };
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

  static Future<http.Response> getUser() {
    return http.get(Endpoint.baseUrl + Endpoint.getUser,
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
}
