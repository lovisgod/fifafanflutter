/// status : "success"
/// data : {"message":"Followed successfully","follower":{"uuid":"0be6f87e-abf2-44d5-93d9-01b203cd7029","user_uuid":"6dc536eb-92a4-4797-af91-0da5ac827efe","follower_uuid":"c901ca67-b839-44ee-a689-bc2142b33b49","blocked":false,"updatedAt":"2021-04-03T07:47:39.206Z","createdAt":"2021-04-03T07:47:39.206Z"}}

class FollowUserResponse {
  String _status;
  FollowerData _data;

  String get status => _status;
  FollowerData get data => _data;

  FollowUserResponse({
      String status, 
      FollowerData data}){
    _status = status;
    _data = data;
}

  FollowUserResponse.fromJson(dynamic json) {
    _status = json["status"];
    _data = json["data"] != null ? FollowerData.fromJson(json["data"]) : null;
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

/// message : "Followed successfully"
/// follower : {"uuid":"0be6f87e-abf2-44d5-93d9-01b203cd7029","user_uuid":"6dc536eb-92a4-4797-af91-0da5ac827efe","follower_uuid":"c901ca67-b839-44ee-a689-bc2142b33b49","blocked":false,"updatedAt":"2021-04-03T07:47:39.206Z","createdAt":"2021-04-03T07:47:39.206Z"}

class FollowerData {
  String _message;
  Follower _follower;

  String get message => _message;
  Follower get follower => _follower;

  FollowerData({
      String message, 
      Follower follower}){
    _message = message;
    _follower = follower;
}

  FollowerData.fromJson(dynamic json) {
    _message = json["message"];
    _follower = json["follower"] != null ? Follower.fromJson(json["follower"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["message"] = _message;
    if (_follower != null) {
      map["follower"] = _follower.toJson();
    }
    return map;
  }

}

/// uuid : "0be6f87e-abf2-44d5-93d9-01b203cd7029"
/// user_uuid : "6dc536eb-92a4-4797-af91-0da5ac827efe"
/// follower_uuid : "c901ca67-b839-44ee-a689-bc2142b33b49"
/// blocked : false
/// updatedAt : "2021-04-03T07:47:39.206Z"
/// createdAt : "2021-04-03T07:47:39.206Z"

class Follower {
  String _uuid;
  String _userUuid;
  String _followerUuid;
  bool _blocked;
  String _updatedAt;
  String _createdAt;

  String get uuid => _uuid;
  String get userUuid => _userUuid;
  String get followerUuid => _followerUuid;
  bool get blocked => _blocked;
  String get updatedAt => _updatedAt;
  String get createdAt => _createdAt;

  Follower({
      String uuid, 
      String userUuid, 
      String followerUuid, 
      bool blocked, 
      String updatedAt, 
      String createdAt}){
    _uuid = uuid;
    _userUuid = userUuid;
    _followerUuid = followerUuid;
    _blocked = blocked;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
}

  Follower.fromJson(dynamic json) {
    _uuid = json["uuid"];
    _userUuid = json["user_uuid"];
    _followerUuid = json["follower_uuid"];
    _blocked = json["blocked"];
    _updatedAt = json["updatedAt"];
    _createdAt = json["createdAt"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["uuid"] = _uuid;
    map["user_uuid"] = _userUuid;
    map["follower_uuid"] = _followerUuid;
    map["blocked"] = _blocked;
    map["updatedAt"] = _updatedAt;
    map["createdAt"] = _createdAt;
    return map;
  }

}