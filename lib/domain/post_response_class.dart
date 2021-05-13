import 'package:sportfan/domain/like_object.dart';
import 'package:sportfan/domain/comment_model.dart';

/// status : "success"
/// data : [{"uuid":"5adf2f1a-75c6-4e0b-8ac4-c22fe8d58602","user_uuid":"a9940d02-7d58-4d09-925b-0c63cedbf6f9","owner_name":"Ayooluwa Olosunde","post":"This is a post","media":"https://res.cloudinary.com/psirius-eem/image/upload/v1612217974/media_mall/0822f534-5352-4589-9c32-cdfb27548cfc.jpg","comment":[],"likes":[],"createdAt":"2021-02-01T22:19:34.699Z"}]

class PostResponseClass {
  String _status;
  List<PostData> _data;

  String get status => _status;
  List<PostData> get data => _data;

  PostResponseClass({String status, List<PostData> data}) {
    _status = status;
    _data = data;
  }

  PostResponseClass.fromJson(dynamic json) {
    _status = json["status"];
    if (json["data"] != null) {
      _data = [];
      json["data"].forEach((v) {
        _data.add(PostData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = _status;
    if (_data != null) {
      map["data"] = _data.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// uuid : "5adf2f1a-75c6-4e0b-8ac4-c22fe8d58602"
/// user_uuid : "a9940d02-7d58-4d09-925b-0c63cedbf6f9"
/// owner_name : "Ayooluwa Olosunde"
/// post : "This is a post"
/// media : "https://res.cloudinary.com/psirius-eem/image/upload/v1612217974/media_mall/0822f534-5352-4589-9c32-cdfb27548cfc.jpg"
/// comment : []
/// likes : []
/// createdAt : "2021-02-01T22:19:34.699Z"

class PostData {
  String _uuid;
  String _userUuid;
  String _ownerName;
  String _post;
  String _media;
  String profile_pic;
  List<Comment_model> _comment;
  List<LikeObject> _likes;
  String _createdAt;

  String get uuid => _uuid;
  String get userUuid => _userUuid;
  String get ownerName => _ownerName;
  String get post => _post;
  String get media => _media;
  String get profilePic => profile_pic;
  List<Comment_model> get comment => _comment;
  List<LikeObject> get likes => _likes;
  String get createdAt => _createdAt;

  PostData(
      {String uuid,
      String userUuid,
      String ownerName,
      String post,
      String media,
      String profilePic,
      List<Comment_model> comment,
      List<LikeObject> likes,
      String createdAt}) {
    _uuid = uuid;
    _userUuid = userUuid;
    _ownerName = ownerName;
    _post = post;
    _media = media;
    profile_pic = profilePic;
    _comment = comment;
    _likes = likes;
    _createdAt = createdAt;
  }

  PostData.fromJson(dynamic json) {
    _uuid = json["uuid"];
    _userUuid = json["user_uuid"];
    _ownerName = json["owner_name"];
    _post = json["post"];
    _media = json["media"];
    profile_pic = json["profile_pic"];
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
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["uuid"] = _uuid;
    map["user_uuid"] = _userUuid;
    map["owner_name"] = _ownerName;
    map["post"] = _post;
    map["media"] = _media;
    map["profile_pic"] = profile_pic;
    if (_comment != null) {
      map["comment"] = _comment.map((v) => v.toJson()).toList();
    }
    if (_likes != null) {
      map["likes"] = _likes.map((v) => v.toJson()).toList();
    }
    map["createdAt"] = _createdAt;
    return map;
  }
}
