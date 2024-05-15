class FindPetBody {
  FindPetBody({
      this.base64, 
      this.missing, 
      this.type, 
      this.gov, 
      this.location,
      this.note,
      this.petID,
  });


  List<String>? base64;
  int? missing;
  String? type;
  String? gov;
  String? location;
  String? petID;
  String? note;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['base64'] = base64;
    map['missing'] = missing;
    map['type'] = type;
    map['gov'] = gov;
    map['location'] = location;
    map['petID'] = petID;
    map['note'] = note;
    return map;
  }

}