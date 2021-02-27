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
}
