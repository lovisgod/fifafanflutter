import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fifafan/constants.dart';
import 'error.dart';
import 'url.dart';
import 'package:get_storage/get_storage.dart';

class FifaService {
  static String getToken() {
    var prefs = GetStorage();
    var token = prefs.read('token');
    debugPrint(token.toString());
    return token.toString();
  }

  static BaseOptions options = BaseOptions(
      baseUrl: Endpoint.baseUrl,
      responseType: ResponseType.plain,
      connectTimeout: CONNECT_TIMEOUT,
      receiveTimeout: RECEIVE_TIMEOUT,
      validateStatus: (code) {
        if (code >= 200) {
          return true;
        }
        return false;
      });
  static Dio dio = Dio(options);
  //Sign IN a User
  static dynamic loginUser({
    @required String email,
    @required String password,
  }) async {
    var uri = Endpoint.login;
//    print(Endpoint.baseUrl);
//    print(uri);
//    print(email);
    print(dio.options.baseUrl);

    await dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options) {
        print(options.path);
        return options;
      },
    ));

    try {
      Response response = await dio.post(uri, data: {
        "email": email,
        "password": password,
      });

      print(response.statusCode);
      print(response);

//      dynamic res = json.decode(response.data);
//      print(res);

      if (response == null) return ErrorType.generic;
      if (response.statusCode == 404) return ErrorType.generic;
      if (response.statusCode == 400) return ErrorType.invalid_credentials;
      if (response.statusCode == 500) return ErrorType.generic;
      if (response.statusCode == 401) return ErrorType.invalid_credentials;
      if (response.statusCode == 200) return json.decode(response.data);

      // }
    } on DioError catch (exception) {
      if (exception == null ||
          exception.toString().contains('SocketException')) {
        return ErrorType.network;
      } else if (exception.type == DioErrorType.RECEIVE_TIMEOUT ||
          exception.type == DioErrorType.CONNECT_TIMEOUT) {
        return ErrorType.timeout;
      } else {
        return ErrorType.generic;
      }
    }
  }

  //Register a User
  static dynamic registerUser(
      {@required String email,
      @required String password,
      @required String confirmPassword,
      @required String fullname,
      @required String username,
      @required String phonenumber,
      @required String role,
      @required String club}) async {
    var uri = Endpoint.register;
    print(Endpoint.baseUrl);
    print(uri);
    print(role);

    if (password != confirmPassword) {
      return ErrorType.password_dont_match;
    } else {
      try {
        Response response = await dio.post(uri, data: {
          "email": email,
          "password": password,
          "phone": phonenumber,
          "name": fullname,
          "username": username,
          "role": "user",
          "status": role,
          "club": club,
        });

        print(response.statusCode);
        if (response == null) return ErrorType.generic;
        if (response.statusCode == 404) return ErrorType.generic;
        if (response.statusCode >= 400 && response.statusCode < 409)
          return ErrorType.invalid_credentials;
        if (response.statusCode == 500) return ErrorType.generic;
        if (response.statusCode == 409) return ErrorType.user_already_exists;
        if (response.statusCode == 200) return json.decode(response.data);

        // }
      } on DioError catch (exception) {
        if (exception == null ||
            exception.toString().contains('SocketException')) {
          return ErrorType.network;
        } else if (exception.type == DioErrorType.RECEIVE_TIMEOUT ||
            exception.type == DioErrorType.CONNECT_TIMEOUT) {
          return ErrorType.timeout;
        } else {
          return ErrorType.generic;
        }
      }
    }
  }

  //Register a User
  static dynamic getPosts() async {
    var uri = Endpoint.getposts;
    print(Endpoint.baseUrl);
    print(uri);
    try {
      dio.options.headers['authorization'] = "Bearer " + getToken();
      Response response = await dio.get(uri);

      print(response.statusCode);
      if (response == null) return ErrorType.generic;
      if (response.statusCode == 404) return ErrorType.generic;
      if (response.statusCode >= 400 && response.statusCode < 409)
        return ErrorType.invalid_credentials;
      if (response.statusCode == 500) return ErrorType.generic;
      if (response.statusCode == 409) return ErrorType.user_already_exists;
      if (response.statusCode == 200) return json.decode(response.data);

      // }
    } on DioError catch (exception) {
      if (exception == null ||
          exception.toString().contains('SocketException')) {
        return ErrorType.network;
      } else if (exception.type == DioErrorType.RECEIVE_TIMEOUT ||
          exception.type == DioErrorType.CONNECT_TIMEOUT) {
        return ErrorType.timeout;
      } else {
        return ErrorType.generic;
      }
    }
  }
}
