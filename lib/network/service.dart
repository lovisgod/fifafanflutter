import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fifafan/constants.dart';
import 'error.dart';
import 'url.dart';

class FifaService {
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
    print(Endpoint.baseUrl);
    print(uri);
    print(email);

    try {
      Response response = await dio.post(uri, data: {
        "phone": email,
        "password": password,
      });

      print(response.statusCode);
      print(response.data);

      dynamic res = json.decode(response.data);
      print(res);

      if (response == null) return ErrorType.generic;
      if (res['code'] == 500) return ErrorType.generic;
      if (res['code'] == 401) return ErrorType.invalid_credentials;
      if (res['code'] == 200) return json.decode(response.data);

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
    print(email);

    if (password != confirmPassword) {
      return ErrorType.password_dont_match;
    } else {
      try {
        Response response = await dio.post(uri, data: {
          "phone": email,
          "password": password,
          "phonenumber": phonenumber,
          "fullname": fullname,
          "username": username,
          "role": role,
          "club": club,
        });

        print(response.statusCode);
        print(response.data);

        dynamic res = json.decode(response.data);
        print(res);

        if (response == null) return ErrorType.generic;
        if (res['code'] == 500) return ErrorType.generic;
        if (res['code'] == 401) return ErrorType.invalid_credentials;
        if (res['code'] == 200) return json.decode(response.data);

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
}
