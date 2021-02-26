import 'dart:io';

import 'package:fifafan/network/networking/CustomException.dart';
import 'package:fifafan/network/networking/client.dart';
import 'package:fifafan/network/networking/response.dart';



class FifaProvider {
  Future<dynamic> getPosts() async {
    var responseJson;
    try {
      final response = await ApiClient.getPosts();
      responseJson = ResponseHandler().response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

}