/// status : "success"
/// data : [{"uuid":"5adf2f1a-75c6-4e0b-8ac4-c22fe8d58602","user_uuid":"a9940d02-7d58-4d09-925b-0c63cedbf6f9","owner_name":"Ayooluwa Olosunde","post":"This is a post","media":"https://res.cloudinary.com/psirius-eem/image/upload/v1612217974/media_mall/0822f534-5352-4589-9c32-cdfb27548cfc.jpg","comment":[],"likes":[],"createdAt":"2021-02-01T22:19:34.699Z"}]

class PostResponseClass {
  String _status;
  List<Data> _data;

  String get status => _status;
  List<Data> get data => _data;

  PostResponseClass({String status, List<Data> data}) {
    _status = status;
    _data = data;
  }

  PostResponseClass.fromJson(dynamic json) {
    _status = json["status"];
    if (json["data"] != null) {
      _data = [];
      json["data"].forEach((v) {
        _data.add(Data.fromJson(v));
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

class Data {
  String _uuid;
  String _userUuid;
  String _ownerName;
  String _post;
  String _media;
  List<dynamic> _comment;
  List<dynamic> _likes;
  String _createdAt;

  String get uuid => _uuid;
  String get userUuid => _userUuid;
  String get ownerName => _ownerName;
  String get post => _post;
  String get media => _media;
  List<dynamic> get comment => _comment;
  List<dynamic> get likes => _likes;
  String get createdAt => _createdAt;

  Data(
      {String uuid,
      String userUuid,
      String ownerName,
      String post,
      String media,
      List<dynamic> comment,
      List<dynamic> likes,
      String createdAt}) {
    _uuid = uuid;
    _userUuid = userUuid;
    _ownerName = ownerName;
    _post = post;
    _media = media;
    _comment = comment;
    _likes = likes;
    _createdAt = createdAt;
  }

  Data.fromJson(dynamic json) {
    _uuid = json["uuid"];
    _userUuid = json["user_uuid"];
    _ownerName = json["owner_name"];
    _post = json["post"];
    _media = json["media"];
    if (json["comment"] != null) {
      _comment = [];
      json["comment"].forEach((v) {
        _comment.add("");
      });
    }
    if (json["likes"] != null) {
      _likes = [];
      json["likes"].forEach((v) {
        _likes.add("");
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
