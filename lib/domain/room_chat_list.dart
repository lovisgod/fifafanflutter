
class Room_chat_list {
  String _status;
  Data _data;

  String get status => _status;
  Data get data => _data;

  Room_chat_list({
      String status, 
      Data data}){
    _status = status;
    _data = data;
}

  Room_chat_list.fromJson(dynamic json) {
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


class Data {
  String _message;
  ChatData _data;

  String get message => _message;
  ChatData get data => _data;

  Data({
      String message,
    ChatData data}){
    _message = message;
    _data = data;
}

  Data.fromJson(dynamic json) {
    _message = json["message"];
    _data = json["data"] != null ? ChatData.fromJson(json["data"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["message"] = _message;
    if (_data != null) {
      map["data"] = _data.toJson();
    }
    return map;
  }

}


class ChatData {
  Room _room;
  List<Chats> _chats;

  Room get room => _room;
  List<Chats> get chats => _chats;

  ChatData({
      Room room, 
      List<Chats> chats}){
    _room = room;
    _chats = chats;
}

  ChatData.fromJson(dynamic json) {
    _room = json["room"] != null ? Room.fromJson(json["room"]) : null;
    if (json["chats"] != null) {
      _chats = [];
      json["chats"].forEach((v) {
        _chats.add(Chats.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_room != null) {
      map["room"] = _room.toJson();
    }
    if (_chats != null) {
      map["chats"] = _chats.map((v) => v.toJson()).toList();
    }
    return map;
  }

}


class Chats {
  String _uuid;
  String _parentUuid;
  String _groupUuid;
  String _senderUuid;
  String _sendername;
  String _message;
  dynamic _deletedAt;
  String _createdAt;
  String _updatedAt;

  String get uuid => _uuid;
  String get parentUuid => _parentUuid;
  String get groupUuid => _groupUuid;
  String get senderUuid => _senderUuid;
  String get sendername => _sendername;
  String get message => _message;
  dynamic get deletedAt => _deletedAt;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;

  Chats({
      String uuid, 
      String parentUuid, 
      String groupUuid, 
      String senderUuid, 
      String sendername, 
      String message, 
      dynamic deletedAt, 
      String createdAt, 
      String updatedAt}){
    _uuid = uuid;
    _parentUuid = parentUuid;
    _groupUuid = groupUuid;
    _senderUuid = senderUuid;
    _sendername = sendername;
    _message = message;
    _deletedAt = deletedAt;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Chats.fromJson(dynamic json) {
    _uuid = json["uuid"];
    _parentUuid = json["parent_uuid"];
    _groupUuid = json["group_uuid"];
    _senderUuid = json["sender_uuid"];
    _sendername = json["sendername"];
    _message = json["message"];
    _deletedAt = json["deleted_at"];
    _createdAt = json["createdAt"];
    _updatedAt = json["updatedAt"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["uuid"] = _uuid;
    map["parent_uuid"] = _parentUuid;
    map["group_uuid"] = _groupUuid;
    map["sender_uuid"] = _senderUuid;
    map["sendername"] = _sendername;
    map["message"] = _message;
    map["deleted_at"] = _deletedAt;
    map["createdAt"] = _createdAt;
    map["updatedAt"] = _updatedAt;
    return map;
  }

}



class Room {
  String _uuid;
  String _name;
  String _description;
  dynamic _icon;
  String _visibility;
  String _updatedAt;

  String get uuid => _uuid;
  String get name => _name;
  String get description => _description;
  dynamic get icon => _icon;
  String get visibility => _visibility;
  String get updatedAt => _updatedAt;

  Room({
      String uuid, 
      String name, 
      String description, 
      dynamic icon, 
      String visibility, 
      String updatedAt}){
    _uuid = uuid;
    _name = name;
    _description = description;
    _icon = icon;
    _visibility = visibility;
    _updatedAt = updatedAt;
}

  Room.fromJson(dynamic json) {
    _uuid = json["uuid"];
    _name = json["name"];
    _description = json["description"];
    _icon = json["icon"];
    _visibility = json["visibility"];
    _updatedAt = json["updatedAt"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["uuid"] = _uuid;
    map["name"] = _name;
    map["description"] = _description;
    map["icon"] = _icon;
    map["visibility"] = _visibility;
    map["updatedAt"] = _updatedAt;
    return map;
  }

}