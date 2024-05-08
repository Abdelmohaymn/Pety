
class WorkHourModel{
  String? id;
  String day;
  String from;
  String to="None";
  int sessionDuration;
  bool isActive;

  WorkHourModel({
    required this.day,
    this.id,
    this.from='None',
    this.to="None",
    this.sessionDuration=30,
    this.isActive=false
  });

}