class PostVotesBody {
  PostVotesBody({
      this.postId,});

  PostVotesBody.fromJson(dynamic json) {
    postId = json['postId'];
  }
  String? postId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['postId'] = postId;
    return map;
  }

}