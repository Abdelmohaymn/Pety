class AppointmentHistoryResponse {
  AppointmentHistoryResponse({
      this.status, 
      this.user, 
      this.data,});

  AppointmentHistoryResponse.fromJson(dynamic json) {
    status = json['status'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(HistoryData.fromJson(v));
      });
    }
  }
  String? status;
  User? user;
  List<HistoryData>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class HistoryData {
  HistoryData({
      this.animalName, 
      this.animalType, 
      this.diagnosisName, 
      this.symptoms, 
      this.medicineName, 
      this.id,});

  HistoryData.fromJson(dynamic json) {
    animalName = json['animalName'];
    animalType = json['animalType'];
    diagnosisName = json['DiagnosisName'];
    symptoms = json['symptoms'];
    medicineName = json['medicineName'];
    id = json['_id'];
  }
  String? animalName;
  String? animalType;
  String? diagnosisName;
  String? symptoms;
  String? medicineName;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['animalName'] = animalName;
    map['animalType'] = animalType;
    map['DiagnosisName'] = diagnosisName;
    map['symptoms'] = symptoms;
    map['medicineName'] = medicineName;
    map['_id'] = id;
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