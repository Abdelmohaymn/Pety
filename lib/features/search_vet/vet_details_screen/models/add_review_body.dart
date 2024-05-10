class AddReviewBody {
  AddReviewBody({
      this.petyId, 
      this.review, 
      this.rating,});

  AddReviewBody.fromJson(dynamic json) {
    petyId = json['petyId'];
    review = json['review'];
    rating = json['rating'];
  }
  String? petyId;
  String? review;
  num? rating;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['petyId'] = petyId;
    map['review'] = review;
    map['rating'] = rating;
    return map;
  }

}