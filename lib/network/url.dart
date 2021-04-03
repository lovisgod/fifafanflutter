class Endpoint {
  //Base URL
  static String baseUrl = "https://fifafans.herokuapp.com/v1.0/api/";
  static String host = "fifafans.herokuapp.com";
  static String path = "/v1.0/api/";
  //Auth
  static String login = "/auth/signin";
  static String register = 'auth/signup';
  static String getposts = 'post/list-posts';
  static String getUserposts = 'post/list-user-posts';
  static String getGroups = 'room/list-rooms';
  static String getUser = 'auth/me';
  static String viewUser = 'user/view-user-details';
  static String commentPost = 'post/comment-post';
  static String likePost = 'post/like-post';
  static String unlikePost = 'post/unlike-post';
  static String createPost = 'post/create-post';
  static String followUser = 'user/follow-user';
  static String unfollowUser = 'user/un-follow-user';

}
