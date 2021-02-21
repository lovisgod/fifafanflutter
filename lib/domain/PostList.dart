import 'package:fifafan/domain/post.dart';

class PostList {
  final List<Post> posts;

  PostList({
    this.posts,
  });

  factory PostList.fromJson(List<dynamic> parsedJson) {
    List<Post> posts = new List<Post>();
    posts = parsedJson.map((i) => Post.fromJson(i)).toList();

    return new PostList(
      posts: posts,
    );
  }
}
