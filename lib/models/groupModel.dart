class Group {
  String id;
  final String name;
  final DateTime time;
  final String message;
  final String mediaUrl;
  final int likes;

  Group({
    this.mediaUrl,
    this.name,
    this.time,
    this.message,
    this.likes,
  });

  Group.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        name = json['name'],
        time = json['time'],
        message = json['message'],
        mediaUrl = json['file'],
        likes = json['likes'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = Map<String, dynamic>();
    map['name'] = name;
    map['message'] = message;
    map['time'] = time;
    map['file'] = mediaUrl;
    map['likes'] = likes;
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  @override
  String toString() => "Record<$name>";
}
