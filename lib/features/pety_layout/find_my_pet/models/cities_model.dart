
class CitiesModel {
  CitiesModel({
      this.type, 
      this.name, 
      this.database, 
      this.data,
  });

  CitiesModel.fromJson(dynamic json) {
    type = json['type'];
    name = json['name'];
    database = json['database'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CitiesData.fromJson(v));
      });
    }
  }
  String? type;
  String? name;
  String? database;
  List<CitiesData>? data;

}

class CitiesData {
  CitiesData({
      this.id, 
      this.governorateId, 
      this.cityNameAr, 
      this.cityNameEn,});

  CitiesData.fromJson(dynamic json) {
    id = json['id'];
    governorateId = json['governorate_id'];
    cityNameAr = json['city_name_ar'];
    cityNameEn = json['city_name_en'];
  }
  String? id;
  String? governorateId;
  String? cityNameAr;
  String? cityNameEn;

}