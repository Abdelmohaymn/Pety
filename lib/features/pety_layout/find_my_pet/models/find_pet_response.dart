class FindPetResponse {
  FindPetResponse({
      this.data,});

  FindPetResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  List<Data>? data;

}

class Data {
  Data({
      this.base64, 
      this.gov, 
      this.location, 
      this.missing, 
      this.petID, 
      this.type,
      this.note,
  });

  Data.fromJson(dynamic json) {
    base64 = json['base64'];
    gov = json['gov'];
    location = json['location'];
    missing = json['missing'];
    petID = json['petID'];
    type = json['type'];
    note = json['note'];
  }
  String? base64;
  String? gov;
  String? location;
  num? missing;
  String? petID;
  String? type;
  String? note;

}