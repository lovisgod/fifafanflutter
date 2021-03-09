/// user_uuid : "a9940d02-7d58-4d09-925b-0c63cedbf6f9"
/// user_name : "Ayooluwa Olosunde"
/// like : "liked"

class LikeObject {
  String _userUuid;
  String _userName;
  String _like;

  String get userUuid => _userUuid;
  String get userName => _userName;
  String get like => _like;

  LikeObject({String userUuid, String userName, String like}) {
    _userUuid = userUuid;
    _userName = userName;
    _like = like;
  }

  LikeObject.fromJson(dynamic json) {
    _userUuid = json["user_uuid"];
    _userName = json["user_name"];
    _like = json["like"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["user_uuid"] = _userUuid;
    map["user_name"] = _userName;
    map["like"] = _like;
    return map;
  }
}
