class AddHistoryResponse {
  AddHistoryResponse({
      this.status, 
      this.data,});

  AddHistoryResponse.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? status;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.numberOfVisits, 
      this.id, 
      this.petyID, 
      this.owner, 
      this.animals, 
      this.appointmentDateTime, 
      this.date, 
      this.time, 
      this.status, 
      this.v, 
      this.hasHistory, 
      this.history,});

  Data.fromJson(dynamic json) {
    numberOfVisits = json['numberOfVisits'];
    id = json['_id'];
    petyID = json['petyID'];
    owner = json['owner'];
    if (json['animals'] != null) {
      animals = [];
      json['animals'].forEach((v) {
        animals?.add(Animals.fromJson(v));
      });
    }
    appointmentDateTime = json['appointmentDateTime'];
    date = json['date'];
    time = json['time'];
    status = json['status'];
    v = json['__v'];
    hasHistory = json['hasHistory'];
    if (json['history'] != null) {
      history = [];
      json['history'].forEach((v) {
        history?.add(History.fromJson(v));
      });
    }
  }
  num? numberOfVisits;
  String? id;
  String? petyID;
  String? owner;
  List<Animals>? animals;
  String? appointmentDateTime;
  String? date;
  String? time;
  String? status;
  num? v;
  bool? hasHistory;
  List<History>? history;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['numberOfVisits'] = numberOfVisits;
    map['_id'] = id;
    map['petyID'] = petyID;
    map['owner'] = owner;
    if (animals != null) {
      map['animals'] = animals?.map((v) => v.toJson()).toList();
    }
    map['appointmentDateTime'] = appointmentDateTime;
    map['date'] = date;
    map['time'] = time;
    map['status'] = status;
    map['__v'] = v;
    map['hasHistory'] = hasHistory;
    if (history != null) {
      map['history'] = history?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class History {
  History({
      this.animalName, 
      this.animalType, 
      this.diagnosisName, 
      this.symptoms, 
      this.medicineName, 
      this.id,});

  History.fromJson(dynamic json) {
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

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pet'] = pet;
    map['count'] = count;
    map['_id'] = id;
    return map;
  }

}