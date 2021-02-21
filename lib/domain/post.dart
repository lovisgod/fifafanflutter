class Post {
  String uuid;
  final String owner_name;
  final DateTime createdAt;
  final String post;
  final String media;
  final List likes;
  final List comment;

  Post({
    this.media,
    this.owner_name,
    this.createdAt,
    this.post,
    this.likes,
    this.comment,
  });

  Post.fromJson(Map<String, dynamic> json)
      : uuid = json['uuid'],
        owner_name = json['name'],
        createdAt = json['time'],
        post = json['message'],
        media = json['file'],
        likes = json['likes'],
        comment = json['comment'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = Map<String, dynamic>();
    map['name'] = owner_name;
    map['message'] = post;
    map['time'] = createdAt;
    map['file'] = media;
    map['likes'] = likes;
    map['comment'] = comment;
    if (uuid != null) {
      map['uuid'] = uuid;
    }
    return map;
  }

  @override
  String toString() => "Record<$owner_name>";
}
