/// uuid : "5095ca51-4dad-4a16-bd18-30cc3027dfe6"
/// user_uuid : "c901ca67-b839-44ee-a689-bc2142b33b49"
/// gender : "Male"
/// shortBio : "This is avery short bio"
/// favoriteQuote : null
/// language : "English, Yoruba"
/// website : "sample.com"
/// profile_pic : "https://res.cloudinary.com/psirius-eem/image/upload/v1617626451/media_mall/25009b66-56ad-4330-9d8c-72aeb7202916.png"
/// createdAt : "2021-04-05T12:40:52.544Z"
/// updatedAt : "2021-04-05T12:40:52.544Z"

class UserProfileData {
  String _uuid;
  String _userUuid;
  String _gender;
  String _shortBio;
  dynamic _favoriteQuote;
  String _language;
  String _website;
  String _profilePic;
  String _createdAt;
  String _updatedAt;

  String get uuid => _uuid;
  String get userUuid => _userUuid;
  String get gender => _gender;
  String get shortBio => _shortBio;
  dynamic get favoriteQuote => _favoriteQuote;
  String get language => _language;
  String get website => _website;
  String get profilePic => _profilePic;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;

  UserProfileData({
      String uuid, 
      String userUuid, 
      String gender, 
      String shortBio, 
      dynamic favoriteQuote, 
      String language, 
      String website, 
      String profilePic, 
      String createdAt, 
      String updatedAt}){
    _uuid = uuid;
    _userUuid = userUuid;
    _gender = gender;
    _shortBio = shortBio;
    _favoriteQuote = favoriteQuote;
    _language = language;
    _website = website;
    _profilePic = profilePic;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  UserProfileData.fromJson(dynamic json) {
    _uuid = json["uuid"];
    _userUuid = json["user_uuid"];
    _gender = json["gender"];
    _shortBio = json["shortBio"];
    _favoriteQuote = json["favoriteQuote"];
    _language = json["language"];
    _website = json["website"];
    _profilePic = json["profile_pic"];
    _createdAt = json["createdAt"];
    _updatedAt = json["updatedAt"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["uuid"] = _uuid;
    map["user_uuid"] = _userUuid;
    map["gender"] = _gender;
    map["shortBio"] = _shortBio;
    map["favoriteQuote"] = _favoriteQuote;
    map["language"] = _language;
    map["website"] = _website;
    map["profile_pic"] = _profilePic;
    map["createdAt"] = _createdAt;
    map["updatedAt"] = _updatedAt;
    return map;
  }

}