class GetUserHistoryResponse {
  GetUserHistoryResponse({
      this.status, 
      this.numOfVistits, 
      this.user, 
      this.data,
  });

  GetUserHistoryResponse.fromJson(dynamic json) {
    status = json['status'];
    numOfVistits = json['numOfVistits'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? status;
  num? numOfVistits;
  User? user;
  Data? data;

}

class Data {
  Data({
      this.appointments,});

  Data.fromJson(dynamic json) {
    if (json['appointments'] != null) {
      appointments = [];
      json['appointments'].forEach((v) {
        appointments?.add(Appointments.fromJson(v));
      });
    }
  }
  List<Appointments>? appointments;

}

class Appointments {
  Appointments({
      this.hasHistory, 
      this.id, 
      this.animals, 
      this.date, 
      this.time, 
      this.status,});

  Appointments.fromJson(dynamic json) {
    hasHistory = json['hasHistory'];
    id = json['_id'];
    if (json['animals'] != null) {
      animals = [];
      json['animals'].forEach((v) {
        animals?.add(Animals.fromJson(v));
      });
    }
    date = json['date'];
    time = json['time'];
    status = json['status'];
  }
  bool? hasHistory;
  String? id;
  List<Animals>? animals;
  String? date;
  String? time;
  String? status;

}

class Animals {
  Animals({
      this.pet, 
      this.count, 
      this.id,});

  Animals.fromJson(dynamic json) {
    pet = json['pet'];
    count = json['count'];
    id = json['_id'];
  }
  String? pet;
  num? count;
  String? id;



}

class User {
  User({
      this.id, 
      this.owner,});

  User.fromJson(dynamic json) {
    id = json['_id'];
    owner = json['owner'] != null ? Owner.fromJson(json['owner']) : null;
  }
  String? id;
  Owner? owner;


}

class Owner {
  Owner({
      this.photo, 
      this.id, 
      this.firstName, 
      this.lastName,});

  Owner.fromJson(dynamic json) {
    photo = json['photo'] != null ? Photo.fromJson(json['photo']) : null;
    id = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
  }
  Photo? photo;
  String? id;
  String? firstName;
  String? lastName;


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

}