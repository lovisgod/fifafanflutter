/// status : "success"
/// data : [{"uuid":"a3a4fa67-4e62-4b56-ab4e-f52ea92e3c7f","user_uuid":"1fb9b96d-a30f-47bd-a33d-06b97e71e251","follower_uuid":"c901ca67-b839-44ee-a689-bc2142b33b49","blocked":false,"user":{"uuid":"1fb9b96d-a30f-47bd-a33d-06b97e71e251","name":"Tochi refereer","email":"tuelodvpfer@gmail.com","username":"Tuvfdde","status":"coach","club":"Barca","phone":810855000000,"profiles":[]},"follower":{"uuid":"c901ca67-b839-44ee-a689-bc2142b33b49","name":"Moses Samuel","email":"ifedayodrealman@gmail.com","username":"mosamuel","status":"fan","club":"Arsenal","phone":8165660000,"profiles":[]}}]

class ListFollowerResponse {
  String _status;
  List<Data> _data;

  String get status => _status;
  List<Data> get data => _data;

  ListFollowerResponse({
      String status, 
      List<Data> data}){
    _status = status;
    _data = data;
}

  ListFollowerResponse.fromJson(dynamic json) {
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

/// uuid : "a3a4fa67-4e62-4b56-ab4e-f52ea92e3c7f"
/// user_uuid : "1fb9b96d-a30f-47bd-a33d-06b97e71e251"
/// follower_uuid : "c901ca67-b839-44ee-a689-bc2142b33b49"
/// blocked : false
/// user : {"uuid":"1fb9b96d-a30f-47bd-a33d-06b97e71e251","name":"Tochi refereer","email":"tuelodvpfer@gmail.com","username":"Tuvfdde","status":"coach","club":"Barca","phone":810855000000,"profiles":[]}
/// follower : {"uuid":"c901ca67-b839-44ee-a689-bc2142b33b49","name":"Moses Samuel","email":"ifedayodrealman@gmail.com","username":"mosamuel","status":"fan","club":"Arsenal","phone":8165660000,"profiles":[]}

class Data {
  String _uuid;
  String _userUuid;
  String _followerUuid;
  bool _blocked;
  FolloweResponseUserData _user;
  Follower _follower;

  String get uuid => _uuid;
  String get userUuid => _userUuid;
  String get followerUuid => _followerUuid;
  bool get blocked => _blocked;
  FolloweResponseUserData get user => _user;
  Follower get follower => _follower;

  Data({
      String uuid, 
      String userUuid, 
      String followerUuid, 
      bool blocked, 
      FolloweResponseUserData user,
      Follower follower}){
    _uuid = uuid;
    _userUuid = userUuid;
    _followerUuid = followerUuid;
    _blocked = blocked;
    _user = user;
    _follower = follower;
}

  Data.fromJson(dynamic json) {
    _uuid = json["uuid"];
    _userUuid = json["user_uuid"];
    _followerUuid = json["follower_uuid"];
    _blocked = json["blocked"];
    _user = json["user"] != null ? FolloweResponseUserData.fromJson(json["user"]) : null;
    _follower = json["follower"] != null ? Follower.fromJson(json["follower"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["uuid"] = _uuid;
    map["user_uuid"] = _userUuid;
    map["follower_uuid"] = _followerUuid;
    map["blocked"] = _blocked;
    if (_user != null) {
      map["user"] = _user.toJson();
    }
    if (_follower != null) {
      map["follower"] = _follower.toJson();
    }
    return map;
  }

}

/// uuid : "c901ca67-b839-44ee-a689-bc2142b33b49"
/// name : "Moses Samuel"
/// email : "ifedayodrealman@gmail.com"
/// username : "mosamuel"
/// status : "fan"
/// club : "Arsenal"
/// phone : 8165660000
/// profiles : []

class Follower {
  String _uuid;
  String _name;
  String _email;
  String _username;
  String _status;
  String _club;
  int _phone;
  List<dynamic> _profiles;

  String get uuid => _uuid;
  String get name => _name;
  String get email => _email;
  String get username => _username;
  String get status => _status;
  String get club => _club;
  int get phone => _phone;
  List<dynamic> get profiles => _profiles;

  Follower({
      String uuid, 
      String name, 
      String email, 
      String username, 
      String status, 
      String club, 
      int phone, 
      List<dynamic> profiles}){
    _uuid = uuid;
    _name = name;
    _email = email;
    _username = username;
    _status = status;
    _club = club;
    _phone = phone;
    _profiles = profiles;
}

  Follower.fromJson(dynamic json) {
    _uuid = json["uuid"];
    _name = json["name"];
    _email = json["email"];
    _username = json["username"];
    _status = json["status"];
    _club = json["club"];
    _phone = json["phone"];
    if (json["profiles"] != null) {
      _profiles = [];
      json["profiles"].forEach((v) {});
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["uuid"] = _uuid;
    map["name"] = _name;
    map["email"] = _email;
    map["username"] = _username;
    map["status"] = _status;
    map["club"] = _club;
    map["phone"] = _phone;
    if (_profiles != null) {
      map["profiles"] = _profiles.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// uuid : "1fb9b96d-a30f-47bd-a33d-06b97e71e251"
/// name : "Tochi refereer"
/// email : "tuelodvpfer@gmail.com"
/// username : "Tuvfdde"
/// status : "coach"
/// club : "Barca"
/// phone : 810855000000
/// profiles : []

class FolloweResponseUserData {
  String _uuid;
  String _name;
  String _email;
  String _username;
  String _status;
  String _club;
  int _phone;
  List<dynamic> _profiles;

  String get uuid => _uuid;
  String get name => _name;
  String get email => _email;
  String get username => _username;
  String get status => _status;
  String get club => _club;
  int get phone => _phone;
  List<dynamic> get profiles => _profiles;

  FolloweResponseUserData({
      String uuid, 
      String name, 
      String email, 
      String username, 
      String status, 
      String club, 
      int phone, 
      List<dynamic> profiles}){
    _uuid = uuid;
    _name = name;
    _email = email;
    _username = username;
    _status = status;
    _club = club;
    _phone = phone;
    _profiles = profiles;
}

  FolloweResponseUserData.fromJson(dynamic json) {
    _uuid = json["uuid"];
    _name = json["name"];
    _email = json["email"];
    _username = json["username"];
    _status = json["status"];
    _club = json["club"];
    _phone = json["phone"];
    if (json["profiles"] != null) {
      _profiles = [];
      json["profiles"].forEach((v) {});
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["uuid"] = _uuid;
    map["name"] = _name;
    map["email"] = _email;
    map["username"] = _username;
    map["status"] = _status;
    map["club"] = _club;
    map["phone"] = _phone;
    if (_profiles != null) {
      map["profiles"] = _profiles.map((v) => v.toJson()).toList();
    }
    return map;
  }

}