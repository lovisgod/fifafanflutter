import 'package:fifafan/domain/comment_model.dart';
import 'package:fifafan/domain/like_object.dart';
import 'package:fifafan/domain/post_response_class.dart';
import 'package:fifafan/domain/user_profile_data.dart';

/// status : "success"
/// data : {"user":{"uuid":"c901ca67-b839-44ee-a689-bc2142b33b49","name":"Moses Samuel","email":"ifedayodrealman@gmail.com","phone":8165660000,"username":"mosamuel","address":null,"verified":false,"role":"user","status":"fan","club":"Arsenal","posts":[{"uuid":"6543d8aa-a45a-4e4e-9148-7d180379b515","user_uuid":"c901ca67-b839-44ee-a689-bc2142b33b49","owner_name":"Moses Samuel","post":"hello from here","media":"<img src=\"https://res.cloudinary.com/psirius-eem/image/upload/v1617311130/media_mall/d5e6fa5e-ce59-4d38-bb99-26ccbd7c0a66.jpg\" class=\"img-fluid\" width=\"526\" alt=\"\"></img>","comment":[],"likes":[],"createdAt":"2021-04-01T21:05:31.352Z","updatedAt":"2021-04-01T21:05:31.352Z"},{"uuid":"7fb14582-fd6e-473d-8242-f683e5d9a053","user_uuid":"c901ca67-b839-44ee-a689-bc2142b33b49","owner_name":"Moses Samuel","post":"so I am getting close to this lady well I DNT know what to do rhough","media":"<img src=\"https://res.cloudinary.com/psirius-eem/image/upload/v1617313377/media_mall/3880e039-1e3e-403a-b3ba-3771b4c3ed71.jpg\" class=\"img-fluid\" width=\"526\" alt=\"\"></img>","comment":[],"likes":[{"user_uuid":"c901ca67-b839-44ee-a689-bc2142b33b49","user_name":"Moses Samuel","like":"liked"}],"createdAt":"2021-04-01T21:42:58.475Z","updatedAt":"2021-04-02T11:31:24.087Z"},{"uuid":"73fbefc6-aa05-44db-a456-9bcfe1da383a","user_uuid":"c901ca67-b839-44ee-a689-bc2142b33b49","owner_name":"Moses Samuel","post":"so I am getting close to this lady well I DNT know what to do ehn.......","media":"<img src=\"https://res.cloudinary.com/psirius-eem/image/upload/v1617313535/media_mall/37781148-617b-4640-8b78-2a9c5fd8e5ab.jpg\" class=\"img-fluid\" width=\"526\" alt=\"\"></img>","comment":[{"user_uuid":"c901ca67-b839-44ee-a689-bc2142b33b49","user_name":"Moses Samuel","date_sent":"2021-04-02T15:33:26.465Z","comment":"this is comment oooooooooo"},{"user_uuid":"c901ca67-b839-44ee-a689-bc2142b33b49","user_name":"Moses Samuel","date_sent":"2021-04-02T16:02:11.036Z","comment":"this is cooment"},{"user_uuid":"c901ca67-b839-44ee-a689-bc2142b33b49","user_name":"Moses Samuel","date_sent":"2021-04-02T16:04:38.250Z","comment":"hello africa this is africa"},{"user_uuid":"c901ca67-b839-44ee-a689-bc2142b33b49","user_name":"Moses Samuel","date_sent":"2021-04-02T16:07:14.967Z","comment":"this is working"},{"user_uuid":"c901ca67-b839-44ee-a689-bc2142b33b49","user_name":"Moses Samuel","date_sent":"2021-04-02T16:10:04.401Z","comment":"there there there"}],"likes":[{"user_uuid":"c901ca67-b839-44ee-a689-bc2142b33b49","user_name":"Moses Samuel","like":"liked"}],"createdAt":"2021-04-01T21:45:35.824Z","updatedAt":"2021-04-02T16:10:04.402Z"},{"uuid":"02c4a027-0eb8-4e5e-81f9-dee65a741697","user_uuid":"c901ca67-b839-44ee-a689-bc2142b33b49","owner_name":"Moses Samuel","post":"omo see Benz oooooooooo. ......  information taking place","media":"<img src=\"https://res.cloudinary.com/psirius-eem/image/upload/v1617383396/media_mall/6d899481-b572-41e0-b0a3-2849ff9ff1e0.jpg\" class=\"img-fluid\" width=\"526\" alt=\"\"></img>","comment":[],"likes":[{"user_uuid":"c901ca67-b839-44ee-a689-bc2142b33b49","user_name":"Moses Samuel","like":"liked"}],"createdAt":"2021-04-02T17:09:56.932Z","updatedAt":"2021-04-02T17:10:12.783Z"}],"profiles":[],"following":false}}

class ViewUserResponse {
  String _status;
  Data _data;

  String get status => _status;
  Data get data => _data;

  ViewUserResponse({
      String status, 
      Data data}){
    _status = status;
    _data = data;
}

  ViewUserResponse.fromJson(dynamic json) {
    _status = json["status"];
    _data = json["data"] != null ? Data.fromJson(json["data"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = _status;
    if (_data != null) {
      map["data"] = _data.toJson();
    }
    return map;
  }

}

/// user : {"uuid":"c901ca67-b839-44ee-a689-bc2142b33b49","name":"Moses Samuel","email":"ifedayodrealman@gmail.com","phone":8165660000,"username":"mosamuel","address":null,"verified":false,"role":"user","status":"fan","club":"Arsenal","posts":[{"uuid":"6543d8aa-a45a-4e4e-9148-7d180379b515","user_uuid":"c901ca67-b839-44ee-a689-bc2142b33b49","owner_name":"Moses Samuel","post":"hello from here","media":"<img src=\"https://res.cloudinary.com/psirius-eem/image/upload/v1617311130/media_mall/d5e6fa5e-ce59-4d38-bb99-26ccbd7c0a66.jpg\" class=\"img-fluid\" width=\"526\" alt=\"\"></img>","comment":[],"likes":[],"createdAt":"2021-04-01T21:05:31.352Z","updatedAt":"2021-04-01T21:05:31.352Z"},{"uuid":"7fb14582-fd6e-473d-8242-f683e5d9a053","user_uuid":"c901ca67-b839-44ee-a689-bc2142b33b49","owner_name":"Moses Samuel","post":"so I am getting close to this lady well I DNT know what to do rhough","media":"<img src=\"https://res.cloudinary.com/psirius-eem/image/upload/v1617313377/media_mall/3880e039-1e3e-403a-b3ba-3771b4c3ed71.jpg\" class=\"img-fluid\" width=\"526\" alt=\"\"></img>","comment":[],"likes":[{"user_uuid":"c901ca67-b839-44ee-a689-bc2142b33b49","user_name":"Moses Samuel","like":"liked"}],"createdAt":"2021-04-01T21:42:58.475Z","updatedAt":"2021-04-02T11:31:24.087Z"},{"uuid":"73fbefc6-aa05-44db-a456-9bcfe1da383a","user_uuid":"c901ca67-b839-44ee-a689-bc2142b33b49","owner_name":"Moses Samuel","post":"so I am getting close to this lady well I DNT know what to do ehn.......","media":"<img src=\"https://res.cloudinary.com/psirius-eem/image/upload/v1617313535/media_mall/37781148-617b-4640-8b78-2a9c5fd8e5ab.jpg\" class=\"img-fluid\" width=\"526\" alt=\"\"></img>","comment":[{"user_uuid":"c901ca67-b839-44ee-a689-bc2142b33b49","user_name":"Moses Samuel","date_sent":"2021-04-02T15:33:26.465Z","comment":"this is comment oooooooooo"},{"user_uuid":"c901ca67-b839-44ee-a689-bc2142b33b49","user_name":"Moses Samuel","date_sent":"2021-04-02T16:02:11.036Z","comment":"this is cooment"},{"user_uuid":"c901ca67-b839-44ee-a689-bc2142b33b49","user_name":"Moses Samuel","date_sent":"2021-04-02T16:04:38.250Z","comment":"hello africa this is africa"},{"user_uuid":"c901ca67-b839-44ee-a689-bc2142b33b49","user_name":"Moses Samuel","date_sent":"2021-04-02T16:07:14.967Z","comment":"this is working"},{"user_uuid":"c901ca67-b839-44ee-a689-bc2142b33b49","user_name":"Moses Samuel","date_sent":"2021-04-02T16:10:04.401Z","comment":"there there there"}],"likes":[{"user_uuid":"c901ca67-b839-44ee-a689-bc2142b33b49","user_name":"Moses Samuel","like":"liked"}],"createdAt":"2021-04-01T21:45:35.824Z","updatedAt":"2021-04-02T16:10:04.402Z"},{"uuid":"02c4a027-0eb8-4e5e-81f9-dee65a741697","user_uuid":"c901ca67-b839-44ee-a689-bc2142b33b49","owner_name":"Moses Samuel","post":"omo see Benz oooooooooo. ......  information taking place","media":"<img src=\"https://res.cloudinary.com/psirius-eem/image/upload/v1617383396/media_mall/6d899481-b572-41e0-b0a3-2849ff9ff1e0.jpg\" class=\"img-fluid\" width=\"526\" alt=\"\"></img>","comment":[],"likes":[{"user_uuid":"c901ca67-b839-44ee-a689-bc2142b33b49","user_name":"Moses Samuel","like":"liked"}],"createdAt":"2021-04-02T17:09:56.932Z","updatedAt":"2021-04-02T17:10:12.783Z"}],"profiles":[],"following":false}

class Data {
  ViewdUser _user;

  ViewdUser get user => _user;

  Data({
      ViewdUser user}){
    _user = user;
}

  Data.fromJson(dynamic json) {
    _user = json["user"] != null ? ViewdUser.fromJson(json["user"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_user != null) {
      map["user"] = _user.toJson();
    }
    return map;
  }

}

/// uuid : "c901ca67-b839-44ee-a689-bc2142b33b49"
/// name : "Moses Samuel"
/// email : "ifedayodrealman@gmail.com"
/// phone : 8165660000
/// username : "mosamuel"
/// address : null
/// verified : false
/// role : "user"
/// status : "fan"
/// club : "Arsenal"
/// posts : [{"uuid":"6543d8aa-a45a-4e4e-9148-7d180379b515","user_uuid":"c901ca67-b839-44ee-a689-bc2142b33b49","owner_name":"Moses Samuel","post":"hello from here","media":"<img src=\"https://res.cloudinary.com/psirius-eem/image/upload/v1617311130/media_mall/d5e6fa5e-ce59-4d38-bb99-26ccbd7c0a66.jpg\" class=\"img-fluid\" width=\"526\" alt=\"\"></img>","comment":[],"likes":[],"createdAt":"2021-04-01T21:05:31.352Z","updatedAt":"2021-04-01T21:05:31.352Z"},{"uuid":"7fb14582-fd6e-473d-8242-f683e5d9a053","user_uuid":"c901ca67-b839-44ee-a689-bc2142b33b49","owner_name":"Moses Samuel","post":"so I am getting close to this lady well I DNT know what to do rhough","media":"<img src=\"https://res.cloudinary.com/psirius-eem/image/upload/v1617313377/media_mall/3880e039-1e3e-403a-b3ba-3771b4c3ed71.jpg\" class=\"img-fluid\" width=\"526\" alt=\"\"></img>","comment":[],"likes":[{"user_uuid":"c901ca67-b839-44ee-a689-bc2142b33b49","user_name":"Moses Samuel","like":"liked"}],"createdAt":"2021-04-01T21:42:58.475Z","updatedAt":"2021-04-02T11:31:24.087Z"},{"uuid":"73fbefc6-aa05-44db-a456-9bcfe1da383a","user_uuid":"c901ca67-b839-44ee-a689-bc2142b33b49","owner_name":"Moses Samuel","post":"so I am getting close to this lady well I DNT know what to do ehn.......","media":"<img src=\"https://res.cloudinary.com/psirius-eem/image/upload/v1617313535/media_mall/37781148-617b-4640-8b78-2a9c5fd8e5ab.jpg\" class=\"img-fluid\" width=\"526\" alt=\"\"></img>","comment":[{"user_uuid":"c901ca67-b839-44ee-a689-bc2142b33b49","user_name":"Moses Samuel","date_sent":"2021-04-02T15:33:26.465Z","comment":"this is comment oooooooooo"},{"user_uuid":"c901ca67-b839-44ee-a689-bc2142b33b49","user_name":"Moses Samuel","date_sent":"2021-04-02T16:02:11.036Z","comment":"this is cooment"},{"user_uuid":"c901ca67-b839-44ee-a689-bc2142b33b49","user_name":"Moses Samuel","date_sent":"2021-04-02T16:04:38.250Z","comment":"hello africa this is africa"},{"user_uuid":"c901ca67-b839-44ee-a689-bc2142b33b49","user_name":"Moses Samuel","date_sent":"2021-04-02T16:07:14.967Z","comment":"this is working"},{"user_uuid":"c901ca67-b839-44ee-a689-bc2142b33b49","user_name":"Moses Samuel","date_sent":"2021-04-02T16:10:04.401Z","comment":"there there there"}],"likes":[{"user_uuid":"c901ca67-b839-44ee-a689-bc2142b33b49","user_name":"Moses Samuel","like":"liked"}],"createdAt":"2021-04-01T21:45:35.824Z","updatedAt":"2021-04-02T16:10:04.402Z"},{"uuid":"02c4a027-0eb8-4e5e-81f9-dee65a741697","user_uuid":"c901ca67-b839-44ee-a689-bc2142b33b49","owner_name":"Moses Samuel","post":"omo see Benz oooooooooo. ......  information taking place","media":"<img src=\"https://res.cloudinary.com/psirius-eem/image/upload/v1617383396/media_mall/6d899481-b572-41e0-b0a3-2849ff9ff1e0.jpg\" class=\"img-fluid\" width=\"526\" alt=\"\"></img>","comment":[],"likes":[{"user_uuid":"c901ca67-b839-44ee-a689-bc2142b33b49","user_name":"Moses Samuel","like":"liked"}],"createdAt":"2021-04-02T17:09:56.932Z","updatedAt":"2021-04-02T17:10:12.783Z"}]
/// profiles : []
/// following : false

class ViewdUser {
  String _uuid;
  String _name;
  String _email;
  int _phone;
  String _username;
  dynamic _address;
  bool _verified;
  String _role;
  String _status;
  String _club;
  List<Posts> _posts;
  List<UserProfileData> _profiles;
  bool _following;

  String get uuid => _uuid;
  String get name => _name;
  String get email => _email;
  int get phone => _phone;
  String get username => _username;
  dynamic get address => _address;
  bool get verified => _verified;
  String get role => _role;
  String get status => _status;
  String get club => _club;
  List<Posts> get posts => _posts;
  List<UserProfileData> get profiles => _profiles;
  bool get following => _following;

  ViewdUser({
      String uuid, 
      String name, 
      String email, 
      int phone, 
      String username, 
      dynamic address, 
      bool verified, 
      String role, 
      String status, 
      String club, 
      List<Posts> posts,
      List<UserProfileData> profiles,
      bool following}){
    _uuid = uuid;
    _name = name;
    _email = email;
    _phone = phone;
    _username = username;
    _address = address;
    _verified = verified;
    _role = role;
    _status = status;
    _club = club;
    _posts = posts;
    _profiles = profiles;
    _following = following;
}

  ViewdUser.fromJson(dynamic json) {
    _uuid = json["uuid"];
    _name = json["name"];
    _email = json["email"];
    _phone = json["phone"];
    _username = json["username"];
    _address = json["address"];
    _verified = json["verified"];
    _role = json["role"];
    _status = json["status"];
    _club = json["club"];
    if (json["posts"] != null) {
      _posts = [];
      json["posts"].forEach((v) {
        _posts.add(Posts.fromJson(v));
      });
    }
    if (json["profiles"] != null) {
      _profiles = [];
      json["profiles"].forEach((v) {
        _profiles.add(UserProfileData.fromJson(v));
      });
    }
    _following = json["following"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["uuid"] = _uuid;
    map["name"] = _name;
    map["email"] = _email;
    map["phone"] = _phone;
    map["username"] = _username;
    map["address"] = _address;
    map["verified"] = _verified;
    map["role"] = _role;
    map["status"] = _status;
    map["club"] = _club;
    if (_posts != null) {
      map["posts"] = _posts.map((v) => v.toJson()).toList();
    }
    if (_profiles != null) {
      map["profiles"] = _profiles.map((v) => v.toJson()).toList();
    }
    map["following"] = _following;
    return map;
  }

}

/// uuid : "6543d8aa-a45a-4e4e-9148-7d180379b515"
/// user_uuid : "c901ca67-b839-44ee-a689-bc2142b33b49"
/// owner_name : "Moses Samuel"
/// post : "hello from here"
/// media : "<img src=\"https://res.cloudinary.com/psirius-eem/image/upload/v1617311130/media_mall/d5e6fa5e-ce59-4d38-bb99-26ccbd7c0a66.jpg\" class=\"img-fluid\" width=\"526\" alt=\"\"></img>"
/// comment : []
/// likes : []
/// createdAt : "2021-04-01T21:05:31.352Z"
/// updatedAt : "2021-04-01T21:05:31.352Z"

class Posts {
  String _uuid;
  String _userUuid;
  String _ownerName;
  String _post;
  String _media;
  List<Comment_model> _comment;
  List<LikeObject> _likes;
  String _createdAt;
  String _updatedAt;

  String get uuid => _uuid;
  String get userUuid => _userUuid;
  String get ownerName => _ownerName;
  String get post => _post;
  String get media => _media;
  List<Comment_model> get comment => _comment;
  List<LikeObject> get likes => _likes;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;

  Posts({
      String uuid, 
      String userUuid, 
      String ownerName, 
      String post, 
      String media, 
      List<Comment_model> comment,
      List<LikeObject> likes,
      String createdAt, 
      String updatedAt}){
    _uuid = uuid;
    _userUuid = userUuid;
    _ownerName = ownerName;
    _post = post;
    _media = media;
    _comment = comment;
    _likes = likes;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Posts.fromJson(dynamic json) {
    _uuid = json["uuid"];
    _userUuid = json["user_uuid"];
    _ownerName = json["owner_name"];
    _post = json["post"];
    _media = json["media"];
    if (json["comment"] != null) {
      _comment = [];
      json["comment"].forEach((v) {
        _comment.add(Comment_model.fromJson(v));
      });
    }
    if (json["likes"] != null) {
      _likes = [];
      json["likes"].forEach((v) {
        _likes.add(LikeObject.fromJson(v));
      });
    }
    _createdAt = json["createdAt"];
    _updatedAt = json["updatedAt"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["uuid"] = _uuid;
    map["user_uuid"] = _userUuid;
    map["owner_name"] = _ownerName;
    map["post"] = _post;
    map["media"] = _media;
    if (_comment != null) {
      map["comment"] = _comment.map((v) => v.toJson()).toList();
    }
    if (_likes != null) {
      map["likes"] = _likes.map((v) => v.toJson()).toList();
    }
    map["createdAt"] = _createdAt;
    map["updatedAt"] = _updatedAt;
    return map;
  }

   PostData toPost() {
    var postt = PostData(
      uuid: _uuid, userUuid: _userUuid, ownerName: _ownerName, post: _post, media: _media, comment: _comment, likes: _likes, createdAt: _createdAt
    );
    return postt;
  }
}