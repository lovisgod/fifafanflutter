/// status : "success"
/// data : {"uuid":"a9940d02-7d58-4d09-925b-0c63cedbf6f9","name":"Ayooluwa Olosunde","email":"ayooluwa.olosunde@gmail.com","phone":8165660000,"username":"Lovisgod","address":null,"verified":false,"role":"user","status":"fan","club":"Arsenal","createdAt":"2021-01-22T21:18:59.331Z","updatedAt":"2021-01-22T21:18:59.331Z","profiles":[]}

class UserProfile {
  String _status;
  User _data;

  String get status => _status;
  User get data => _data;

  UserProfile({String status, User data}) {
    _status = status;
    _data = data;
  }

  UserProfile.fromJson(dynamic json) {
    _status = json["status"];
    _data = json["data"] != null ? User.fromJson(json["data"]) : null;
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

/// uuid : "a9940d02-7d58-4d09-925b-0c63cedbf6f9"
/// name : "Ayooluwa Olosunde"
/// email : "ayooluwa.olosunde@gmail.com"
/// phone : 8165660000
/// username : "Lovisgod"
/// address : null
/// verified : false
/// role : "user"
/// status : "fan"
/// club : "Arsenal"
/// createdAt : "2021-01-22T21:18:59.331Z"
/// updatedAt : "2021-01-22T21:18:59.331Z"
/// profiles : []

class User {
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
  String _createdAt;
  String _updatedAt;
  List<dynamic> _profiles;

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
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  List<dynamic> get profiles => _profiles;

  User(
      {String uuid,
      String name,
      String email,
      int phone,
      String username,
      dynamic address,
      bool verified,
      String role,
      String status,
      String club,
      String createdAt,
      String updatedAt,
      List<dynamic> profiles}) {
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
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _profiles = profiles;
  }

  User.fromJson(dynamic json) {
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
    _createdAt = json["createdAt"];
    _updatedAt = json["updatedAt"];
//    if (json["profiles"] != null) {
//      _profiles = [];
//      json["profiles"].forEach((v) {
//        _profiles.add(dynamic.fromJson(v));
//      });
//    }
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
    map["createdAt"] = _createdAt;
    map["updatedAt"] = _updatedAt;
    if (_profiles != null) {
      map["profiles"] = _profiles.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
