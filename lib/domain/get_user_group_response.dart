/// status : "success"
/// data : {"message":"Success","data":[{"uuid":"b15fec7f-32da-4faf-9177-42b9189d835e","chatroom_uuid":"8c00929c-db4b-4530-91e3-d6b823d744d2","member_uuid":"c901ca67-b839-44ee-a689-bc2142b33b49","is_banned":false,"createdAt":"2021-04-03T09:22:23.494Z","updatedAt":"2021-04-03T09:22:23.494Z","ChatRoom":{"uuid":"8c00929c-db4b-4530-91e3-d6b823d744d2","name":"Tatiana Roomie","description":"This is a master room, Falz the bad guy in the building","icon":null,"visibility":"private","createdAt":"2021-02-26T23:49:27.135Z","updatedAt":"2021-02-26T23:49:27.135Z"}}]}

class GetUserGroupResponse {
  String _status;
  UserGroupResponseData _data;

  String get status => _status;
  UserGroupResponseData get data => _data;

  GetUserGroupResponse({
      String status, 
      UserGroupResponseData data}){
    _status = status;
    _data = data;
}

  GetUserGroupResponse.fromJson(dynamic json) {
    _status = json["status"];
    _data = json["data"] != null ? UserGroupResponseData.fromJson(json["data"]) : null;
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

/// message : "Success"
/// data : [{"uuid":"b15fec7f-32da-4faf-9177-42b9189d835e","chatroom_uuid":"8c00929c-db4b-4530-91e3-d6b823d744d2","member_uuid":"c901ca67-b839-44ee-a689-bc2142b33b49","is_banned":false,"createdAt":"2021-04-03T09:22:23.494Z","updatedAt":"2021-04-03T09:22:23.494Z","ChatRoom":{"uuid":"8c00929c-db4b-4530-91e3-d6b823d744d2","name":"Tatiana Roomie","description":"This is a master room, Falz the bad guy in the building","icon":null,"visibility":"private","createdAt":"2021-02-26T23:49:27.135Z","updatedAt":"2021-02-26T23:49:27.135Z"}}]

class UserGroupResponseData {
  String _message;
  List<Data> _data;

  String get message => _message;
  List<Data> get data => _data;

  UserGroupResponseData({
      String message, 
      List<Data> data}){
    _message = message;
    _data = data;
}

  UserGroupResponseData.fromJson(dynamic json) {
    _message = json["message"];
    if (json["data"] != null) {
      _data = [];
      json["data"].forEach((v) {
        _data.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["message"] = _message;
    if (_data != null) {
      map["data"] = _data.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// uuid : "b15fec7f-32da-4faf-9177-42b9189d835e"
/// chatroom_uuid : "8c00929c-db4b-4530-91e3-d6b823d744d2"
/// member_uuid : "c901ca67-b839-44ee-a689-bc2142b33b49"
/// is_banned : false
/// createdAt : "2021-04-03T09:22:23.494Z"
/// updatedAt : "2021-04-03T09:22:23.494Z"
/// ChatRoom : {"uuid":"8c00929c-db4b-4530-91e3-d6b823d744d2","name":"Tatiana Roomie","description":"This is a master room, Falz the bad guy in the building","icon":null,"visibility":"private","createdAt":"2021-02-26T23:49:27.135Z","updatedAt":"2021-02-26T23:49:27.135Z"}

class Data {
  String _uuid;
  String _chatroomUuid;
  String _memberUuid;
  bool _isBanned;
  String _createdAt;
  String _updatedAt;
  ChatRoom _chatRoom;

  String get uuid => _uuid;
  String get chatroomUuid => _chatroomUuid;
  String get memberUuid => _memberUuid;
  bool get isBanned => _isBanned;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  ChatRoom get chatRoom => _chatRoom;

  Data({
      String uuid, 
      String chatroomUuid, 
      String memberUuid, 
      bool isBanned, 
      String createdAt, 
      String updatedAt, 
      ChatRoom chatRoom}){
    _uuid = uuid;
    _chatroomUuid = chatroomUuid;
    _memberUuid = memberUuid;
    _isBanned = isBanned;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _chatRoom = chatRoom;
}

  Data.fromJson(dynamic json) {
    _uuid = json["uuid"];
    _chatroomUuid = json["chatroom_uuid"];
    _memberUuid = json["member_uuid"];
    _isBanned = json["is_banned"];
    _createdAt = json["createdAt"];
    _updatedAt = json["updatedAt"];
    _chatRoom = json["ChatRoom"] != null ? ChatRoom.fromJson(json["ChatRoom"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["uuid"] = _uuid;
    map["chatroom_uuid"] = _chatroomUuid;
    map["member_uuid"] = _memberUuid;
    map["is_banned"] = _isBanned;
    map["createdAt"] = _createdAt;
    map["updatedAt"] = _updatedAt;
    if (_chatRoom != null) {
      map["ChatRoom"] = _chatRoom.toJson();
    }
    return map;
  }

}

/// uuid : "8c00929c-db4b-4530-91e3-d6b823d744d2"
/// name : "Tatiana Roomie"
/// description : "This is a master room, Falz the bad guy in the building"
/// icon : null
/// visibility : "private"
/// createdAt : "2021-02-26T23:49:27.135Z"
/// updatedAt : "2021-02-26T23:49:27.135Z"

class ChatRoom {
  String _uuid;
  String _name;
  String _description;
  dynamic _icon;
  String _visibility;
  String _createdAt;
  String _updatedAt;

  String get uuid => _uuid;
  String get name => _name;
  String get description => _description;
  dynamic get icon => _icon;
  String get visibility => _visibility;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;

  ChatRoom({
      String uuid, 
      String name, 
      String description, 
      dynamic icon, 
      String visibility, 
      String createdAt, 
      String updatedAt}){
    _uuid = uuid;
    _name = name;
    _description = description;
    _icon = icon;
    _visibility = visibility;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  ChatRoom.fromJson(dynamic json) {
    _uuid = json["uuid"];
    _name = json["name"];
    _description = json["description"];
    _icon = json["icon"];
    _visibility = json["visibility"];
    _createdAt = json["createdAt"];
    _updatedAt = json["updatedAt"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["uuid"] = _uuid;
    map["name"] = _name;
    map["description"] = _description;
    map["icon"] = _icon;
    map["visibility"] = _visibility;
    map["createdAt"] = _createdAt;
    map["updatedAt"] = _updatedAt;
    return map;
  }

}