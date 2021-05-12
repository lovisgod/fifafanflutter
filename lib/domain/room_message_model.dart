/// user : "Ayooluwa Moses Sunday"
/// message_uuid : "156fb954-cf0b-4e60-b38c-6e623333b3c1"
/// message : "this is sample"
/// createdAt : 1620805324056

class Room_message_model {
  String _user;
  String _messageUuid;
  String _message;
  int _createdAt;

  String get user => _user;
  String get messageUuid => _messageUuid;
  String get message => _message;
  int get createdAt => _createdAt;

  Room_message_model({
      String user, 
      String messageUuid, 
      String message, 
      int createdAt}){
    _user = user;
    _messageUuid = messageUuid;
    _message = message;
    _createdAt = createdAt;
}

  Room_message_model.fromJson(dynamic json) {
    _user = json["user"];
    _messageUuid = json["message_uuid"];
    _message = json["message"];
    _createdAt = json["createdAt"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["user"] = _user;
    map["message_uuid"] = _messageUuid;
    map["message"] = _message;
    map["createdAt"] = _createdAt;
    return map;
  }

}