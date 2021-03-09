import 'package:fifafan/domain/group_list_response.dart';
import 'package:fifafan/domain/post_response_class.dart';
import 'package:fifafan/domain/user_profile.dart';
import 'package:fifafan/providers/podcastProvider.dart';

class FifaRepository {
  FifaProvider provider = FifaProvider();
  Future<PostResponseClass> getPosts() async {
    final response = await provider.getPosts();
    return PostResponseClass.fromJson(response);
  }

  Future<PostResponseClass> getUserPosts() async {
    final response = await provider.getUserPosts();
    return PostResponseClass.fromJson(response);
  }

  Future<GroupListResponse> getGroups() async {
    final response = await provider.getGroups();
    return GroupListResponse.fromJson(response);
  }

  Future<User> getUser() async {
    final response = await provider.getUser();
    return UserProfile.fromJson(response).data;
  }
}
