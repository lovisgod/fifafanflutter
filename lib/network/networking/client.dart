import 'package:fifafan/network/url.dart';
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

  static uploadImage(String name, String postBody) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse(Endpoint.baseUrl + Endpoint.getUser));
    request.files.add(await http.MultipartFile.fromPath('media', name));
    request.headers['Authorization'] = '${getToken()}';
    var res = await request.send();
    return res.statusCode;
  }
}
