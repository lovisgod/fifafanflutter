
import 'package:fifafan/domain/post_response_class.dart';
import 'package:fifafan/providers/podcastProvider.dart';

class FifaRepository {
   FifaProvider provider = FifaProvider();
   Future<PostResponseClass> getPosts() async {
     final response = await provider.getPosts();
     return PostResponseClass.fromJson(response);
  }
}