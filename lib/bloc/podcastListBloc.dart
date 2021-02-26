import 'dart:async';
import 'package:fifafan/domain/post_response_class.dart';
import 'package:fifafan/network/networking/ResponseHelper.dart';
import 'package:fifafan/repository/podcatListRepository.dart';

class PostListBloc {
  FifaRepository _postListRepository;
  StreamController postListController;

  StreamSink<Response<PostResponseClass>> get getPostSink =>
      postListController.sink;

  Stream<Response<PostResponseClass>> get postListStream =>
      postListController.stream;

  PodcastListBloc() {
    postListController = StreamController<Response<PostResponseClass>>();
    _postListRepository = FifaRepository();
    getPosts();
  }

  getPosts() async {
    getPostSink.add(Response.loading('Getting Podcast list.....'));
    try {
      PostResponseClass postResponseClass =
      await _postListRepository.getPosts();
      getPostSink.add(Response.completed(postResponseClass));
    } catch (e) {
      getPostSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    postListController?.close();
  }
}
