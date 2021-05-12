import 'package:sportfan/domain/post_response_class.dart';

/// status : "success"
/// data : {"message":"Success","data":[{"uuid":"8c00929c-db4b-4530-91e3-d6b823d744d2","name":"Tatiana Roomie","description":"This is a master room, Falz the bad guy in the building","icon":null,"visibility":"private","createdAt":"2021-02-26T23:49:27.135Z","updatedAt":"2021-02-26T23:49:27.135Z"}]}

class GroupListResponse {
  String _status;
  Data _data;

  String get status => _status;
  Data get data => _data;

  GroupListResponse({String status, Data data}) {
    _status = status;
    _data = data;
  }

  GroupListResponse.fromJson(dynamic json) {
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

/// message : "Success"
/// data : [{"uuid":"8c00929c-db4b-4530-91e3-d6b823d744d2","name":"Tatiana Roomie","description":"This is a master room, Falz the bad guy in the building","icon":null,"visibility":"private","createdAt":"2021-02-26T23:49:27.135Z","updatedAt":"2021-02-26T23:49:27.135Z"}]

class Data {
  String _message;
  List<GroupData> _data;

  String get message => _message;
  List<GroupData> get data => _data;

  Data({String message, List<GroupData> data}) {
    _message = message;
    _data = data;
  }

  Data.fromJson(dynamic json) {
    _message = json["message"];
    if (json["data"] != null) {
      _data = [];
      json["data"].forEach((v) {
        _data.add(GroupData.fromJson(v));
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

/// uuid : "8c00929c-db4b-4530-91e3-d6b823d744d2"
/// name : "Tatiana Roomie"
/// description : "This is a master room, Falz the bad guy in the building"
/// icon : null
/// visibility : "private"
/// createdAt : "2021-02-26T23:49:27.135Z"
/// updatedAt : "2021-02-26T23:49:27.135Z"

class GroupData {
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

  GroupData(
      {String uuid,
      String name,
      String description,
      dynamic icon,
      String visibility,
      String createdAt,
      String updatedAt}) {
    _uuid = uuid;
    _name = name;
    _description = description;
    _icon = icon;
    _visibility = visibility;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  GroupData.fromJson(dynamic json) {
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
