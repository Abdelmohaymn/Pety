class UserVisitsResponse {
  UserVisitsResponse({
      this.status, 
      this.results, 
      this.data,});

  UserVisitsResponse.fromJson(dynamic json) {
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
  num? results;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['results'] = results;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
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
    petyID = json['petyID'] != null ? PetyId.fromJson(json['petyID']) : null;
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
  PetyId? petyID;
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
    if (petyID != null) {
      map['petyID'] = petyID?.toJson();
    }
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

class PetyId {
  PetyId({
      this.id, 
      this.petyName, 
      this.role, 
  });

  PetyId.fromJson(dynamic json) {
    id = json['_id'];
    petyName = json['petyName'];
    role = json['role'];
  }
  String? id;
  String? petyName;
  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['petyName'] = petyName;
    map['role'] = role;
    return map;
  }

}