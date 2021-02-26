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
   return http.get(Endpoint.baseUrl + Endpoint.getposts, headers: {"Authorization": "Bearer ${getToken()}"});
 }

}