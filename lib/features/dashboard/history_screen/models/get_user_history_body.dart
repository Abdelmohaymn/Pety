class GetUserHistoryBody {
  GetUserHistoryBody({
      this.owner, 
      this.role,});

  GetUserHistoryBody.fromJson(dynamic json) {
    owner = json['owner'];
    role = json['role'];
  }
  String? owner;
  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['owner'] = owner;
    map['role'] = role;
    return map;
  }

}