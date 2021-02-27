import 'package:fifafan/domain/group_list_response.dart';
import 'package:fifafan/domain/post_response_class.dart';
import 'package:fifafan/providers/podcastProvider.dart';
import 'package:flutter/cupertino.dart';

class FifaRepository {
  FifaProvider provider = FifaProvider();
  Future<PostResponseClass> getPosts() async {
    final response = await provider.getPosts();
    return PostResponseClass.fromJson(response);
  }

  Future<GroupListResponse> getGroups() async {
    final response = await provider.getGroups();
    return GroupListResponse.fromJson(response);
  }
}
