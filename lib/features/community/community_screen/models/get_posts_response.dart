class GetPostsResponse {
  GetPostsResponse({
      this.status, 
      this.results, 
      this.data,});

  GetPostsResponse.fromJson(dynamic json) {
    status = json['status'];
    results = json['results'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  String? status;
  int? results;
  List<Data>? data;

}

class Data {
  Data({
      this.id, 
      this.user, 
      this.title, 
      this.context, 
      this.votes, 
      this.upvotes, 
      this.downvotes, 
      this.tags, 
      this.bookmarks, 
      this.createdAt,
      this.photo,
      });

  Data.fromJson(dynamic json) {
    id = json['_id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    title = json['title'];
    context = json['context'];
    votes = json['votes'];
    upvotes = json['upvotes'] != null ? json['upvotes'].cast<String>() : [];
    downvotes = json['downvotes'] != null ? json['downvotes'].cast<String>() : [];
    tags = json['tags'] != null ? json['tags'].cast<String>() : [];
    bookmarks = json['bookmarks'] != null ? json['bookmarks'].cast<String>() : [];
    createdAt = json['createdAt'];
    photo = json['photo'] != null ? Photo.fromJson(json['photo']) : null;
  }
  String? id;
  User? user;
  String? title;
  String? context;
  int? votes;
  List<String>? upvotes;
  List<String>? downvotes;
  List<String>? tags;
  List<String>? bookmarks;
  String? createdAt;
  Photo? photo;


}

class User {
  User({
      this.photo, 
      this.id, 
      this.firstName, 
      this.lastName,});

  User.fromJson(dynamic json) {
    photo = json['photo'] != null ? Photo.fromJson(json['photo']) : null;
    id = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
  }
  Photo? photo;
  String? id;
  String? firstName;
  String? lastName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (photo != null) {
      map['photo'] = photo?.toJson();
    }
    map['_id'] = id;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    return map;
  }

}

class Photo {
  Photo({
      this.url, 
      this.publicId,});

  Photo.fromJson(dynamic json) {
    url = json['url'];
    publicId = json['public_id'];
  }
  String? url;
  String? publicId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    map['public_id'] = publicId;
    return map;
  }

}