/// status : "success"
/// data : [{"uuid":"a1b0aeca-9d26-4c46-8c42-616e71e3cad2","sender_uuid":"c901ca67-b839-44ee-a689-bc2142b33b49","recipient_uuid":"1fb9b96d-a30f-47bd-a33d-06b97e71e251","parent_uuid":null,"message":"mumu mumu","deleted_at":null,"createdAt":"2021-05-12T16:02:48.732Z","updatedAt":"2021-05-12T16:02:48.732Z"},{"uuid":"5ca60dfd-f23a-4148-8622-ec112dcc65d2","sender_uuid":"c901ca67-b839-44ee-a689-bc2142b33b49","recipient_uuid":"1fb9b96d-a30f-47bd-a33d-06b97e71e251","parent_uuid":null,"message":"mumu mumu","deleted_at":null,"createdAt":"2021-05-12T16:02:49.676Z","updatedAt":"2021-05-12T16:02:49.676Z"},{"uuid":"d87f1068-f00c-44ae-95fa-96a0b9ac8b8a","sender_uuid":"c901ca67-b839-44ee-a689-bc2142b33b49","recipient_uuid":"1fb9b96d-a30f-47bd-a33d-06b97e71e251","parent_uuid":null,"message":"hell tochi","deleted_at":null,"createdAt":"2021-05-12T16:17:27.536Z","updatedAt":"2021-05-12T16:17:27.536Z"}]

class Personal_message_list_model {
  String _status;
  List<PersonalChatData> _data;

  String get status => _status;
  List<PersonalChatData> get data => _data;

  Personal_message_list_model({
      String status, 
      List<PersonalChatData> data}){
    _status = status;
    _data = data;
}

  Personal_message_list_model.fromJson(dynamic json) {
    _status = json["status"];
    if (json["data"] != null) {
      _data = [];
      json["data"].forEach((v) {
        _data.add(PersonalChatData.fromJson(v));
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

/// uuid : "a1b0aeca-9d26-4c46-8c42-616e71e3cad2"
/// sender_uuid : "c901ca67-b839-44ee-a689-bc2142b33b49"
/// recipient_uuid : "1fb9b96d-a30f-47bd-a33d-06b97e71e251"
/// parent_uuid : null
/// message : "mumu mumu"
/// deleted_at : null
/// createdAt : "2021-05-12T16:02:48.732Z"
/// updatedAt : "2021-05-12T16:02:48.732Z"

class PersonalChatData {
  String _uuid;
  String _senderUuid;
  String _recipientUuid;
  dynamic _parentUuid;
  String _message;
  dynamic _deletedAt;
  String _createdAt;
  String _updatedAt;

  String get uuid => _uuid;
  String get senderUuid => _senderUuid;
  String get recipientUuid => _recipientUuid;
  dynamic get parentUuid => _parentUuid;
  String get message => _message;
  dynamic get deletedAt => _deletedAt;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;

  PersonalChatData({
      String uuid, 
      String senderUuid, 
      String recipientUuid, 
      dynamic parentUuid, 
      String message, 
      dynamic deletedAt, 
      String createdAt, 
      String updatedAt}){
    _uuid = uuid;
    _senderUuid = senderUuid;
    _recipientUuid = recipientUuid;
    _parentUuid = parentUuid;
    _message = message;
    _deletedAt = deletedAt;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  PersonalChatData.fromJson(dynamic json) {
    _uuid = json["uuid"];
    _senderUuid = json["sender_uuid"];
    _recipientUuid = json["recipient_uuid"];
    _parentUuid = json["parent_uuid"];
    _message = json["message"];
    _deletedAt = json["deleted_at"];
    _createdAt = json["createdAt"];
    _updatedAt = json["updatedAt"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["uuid"] = _uuid;
    map["sender_uuid"] = _senderUuid;
    map["recipient_uuid"] = _recipientUuid;
    map["parent_uuid"] = _parentUuid;
    map["message"] = _message;
    map["deleted_at"] = _deletedAt;
    map["createdAt"] = _createdAt;
    map["updatedAt"] = _updatedAt;
    return map;
  }

}