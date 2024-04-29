
import 'package:pety/features/dashboard/work_hours/models/get_work_hours_response.dart';
import 'package:pety/features/dashboard/work_hours/models/work_hour_model.dart';
import 'package:pety/features/dashboard/work_hours/models/work_hours_body.dart';
import 'package:pety/shared/extensions.dart';

class GetWorkHourMapper{

  static List<WorkHourModel> mapFromResponse(GetWorkHoursResponse response){
    List<WorkHourModel> workHours = [
      WorkHourModel(day:'saturday'),
      WorkHourModel(day:'sunday'),
      WorkHourModel(day:'monday'),
      WorkHourModel(day:'tuesday'),
      WorkHourModel(day:'wednesday'),
      WorkHourModel(day:'thursday'),
      WorkHourModel(day:'friday'),
    ];
    if(response.data!.isNotEmpty){
      int index=0;
      for (var element in response.data!) {
        while(element.day!=workHours[index].day) {
          index++;
        }
        if(index==7)break;
        workHours[index].day = workHours[index].day.capitalizeFirstLetter();
        workHours[index].id=element.id;
        workHours[index].from=element.startTime!;
        workHours[index].to=element.endTime!;
        workHours[index].sessionDuration=element.sessionDuration!;
        workHours[index].isActive=true;
      }
    }
    for (var element in workHours) {
      element.day = element.day.capitalizeFirstLetter();
    }
    return workHours;
  }

  static WorkHoursBody mapToBody(List<WorkHourModel> model){
    WorkHoursBody body = WorkHoursBody(availability: []);
    for (var element in model) {
      if(element.isActive){
        body.availability!.add(
          Availability(
            day:element.day.toLowerCase(),
            startTime: element.from,
            endTime: element.to,
            sessionDuration: element.sessionDuration
          )
        );
      }
    }
    return body;
  }

}