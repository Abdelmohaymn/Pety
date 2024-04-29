class GetWorkHoursResponse {
  GetWorkHoursResponse({
      this.status, 
      this.results, 
      this.data,});

  GetWorkHoursResponse.fromJson(dynamic json) {
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
      this.day, 
      this.startTime, 
      this.endTime, 
      this.sessionDuration, 
      this.id, 
      });

  Data.fromJson(dynamic json) {
    day = json['day'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    sessionDuration = json['sessionDuration'];
    id = json['_id'];
  }
  String? day;
  String? startTime;
  String? endTime;
  String? sessionDuration;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['day'] = day;
    map['startTime'] = startTime;
    map['endTime'] = endTime;
    map['sessionDuration'] = sessionDuration;
    map['_id'] = id;
    return map;
  }

}