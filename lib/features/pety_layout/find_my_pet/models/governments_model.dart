
class GovernmentsModel {
  GovernmentsModel({
      this.type, 
      this.name, 
      this.database, 
      this.data,});

  GovernmentsModel.fromJson(dynamic json) {
    type = json['type'];
    name = json['name'];
    database = json['database'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(GovernmentsData.fromJson(v));
      });
    }
  }
  String? type;
  String? name;
  String? database;
  List<GovernmentsData>? data;


}

class GovernmentsData {
  GovernmentsData({
      this.id, 
      this.governorateNameAr, 
      this.governorateNameEn,});

  GovernmentsData.fromJson(dynamic json) {
    id = json['id'];
    governorateNameAr = json['governorate_name_ar'];
    governorateNameEn = json['governorate_name_en'];
  }
  String? id;
  String? governorateNameAr;
  String? governorateNameEn;


}