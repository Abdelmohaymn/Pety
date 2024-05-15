class UploadPetResponse {
  UploadPetResponse({
      this.data,});

  UploadPetResponse.fromJson(dynamic json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.success,});

  Data.fromJson(dynamic json) {
    success = json['success'];
  }
  String? success;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    return map;
  }

}