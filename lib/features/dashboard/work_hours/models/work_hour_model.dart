
class WorkHourModel{
  String? id;
  String day;
  String from;
  String to="None";
  String sessionDuration;
  bool isActive;

  WorkHourModel({
    required this.day,
    this.id,
    this.from='None',
    this.to="None",
    this.sessionDuration="",
    this.isActive=false
  });

}