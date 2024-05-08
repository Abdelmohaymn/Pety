import 'package:freezed_annotation/freezed_annotation.dart';


class PetyDetailsResponse {
  PetyDetailsResponse({
    this.status,
    this.data,
  });

  PetyDetailsResponse.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null ? ReviewsData.fromJson(json['data']) : null;
  }
  String? status;
  @JsonKey(name:'data')
  ReviewsData? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class ReviewsData {
  ReviewsData({
    this.reviews,
  });

  ReviewsData.fromJson(dynamic json) {
    if (json['reviews'] != null) {
      reviews = [];
      json['reviews'].forEach((v) {
        reviews?.add(Reviews.fromJson(v));
      });
    }
  }

  List<Reviews>? reviews;

  Map<String, dynamic> toJson() {
    Map<String,dynamic>map={};
    if (reviews != null) {
      map['reviews'] = reviews?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Reviews {
  Reviews({
    this.id,
    this.review,
    this.rating,
    this.createdAt,
    this.user,
  });

  Reviews.fromJson(dynamic json) {
    id = json['_id'];
    review = json['review'];
    rating = json['rating'];
    createdAt = json['createdAt'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? id;
  String? review;
  num? rating;
  String? createdAt;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['review'] = review;
    map['rating'] = rating;
    map['createdAt'] = createdAt;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

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
