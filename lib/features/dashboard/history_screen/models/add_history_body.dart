class AddHistoryBody {
  AddHistoryBody({
      this.appointmentId, 
      this.history,
  });

  AddHistoryBody.fromJson(dynamic json) {
    appointmentId = json['appointmentId'];
    if (json['history'] != null) {
      history = [];
      json['history'].forEach((v) {
        history?.add(History.fromJson(v));
      });
    }
  }
  String? appointmentId;
  List<History>? history;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['appointmentId'] = appointmentId;
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
      this.medicineName,});

  History.fromJson(dynamic json) {
    animalName = json['animalName'];
    animalType = json['animalType'];
    diagnosisName = json['DiagnosisName'];
    symptoms = json['symptoms'];
    medicineName = json['medicineName'];
  }
  String? animalName;
  String? animalType;
  String? diagnosisName;
  String? symptoms;
  String? medicineName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['animalName'] = animalName;
    map['animalType'] = animalType;
    map['DiagnosisName'] = diagnosisName;
    map['symptoms'] = symptoms;
    map['medicineName'] = medicineName;
    return map;
  }

}