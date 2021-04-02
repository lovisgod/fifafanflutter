/// user_uuid : "c901ca67-b839-44ee-a689-bc2142b33b49"
/// user_name : "Moses Samuel"
/// date_sent : "2021-04-02T15:33:26.465Z"
/// comment : "this is comment oooooooooo"

class Comment_model {
  String _userUuid;
  String _userName;
  String _dateSent;
  String _comment;

  String get userUuid => _userUuid;
  String get userName => _userName;
  String get dateSent => _dateSent;
  String get comment => _comment;

  Comment_model({
      String userUuid, 
      String userName, 
      String dateSent, 
      String comment}){
    _userUuid = userUuid;
    _userName = userName;
    _dateSent = dateSent;
    _comment = comment;
}

  Comment_model.fromJson(dynamic json) {
    _userUuid = json["user_uuid"];
    _userName = json["user_name"];
    _dateSent = json["date_sent"];
    _comment = json["comment"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["user_uuid"] = _userUuid;
    map["user_name"] = _userName;
    map["date_sent"] = _dateSent;
    map["comment"] = _comment;
    return map;
  }

}