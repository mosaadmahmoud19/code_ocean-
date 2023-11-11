import 'package:code_ocean/ocean/domain/entities/road_map_week/road_map_time_line_date_data_week.dart';
import 'package:code_ocean/ocean/domain/entities/road_map_week/road_map_time_line_tasks_week.dart';
import 'package:equatable/equatable.dart';

class RoadMapTimeLineSprintsWeek extends Equatable
{
 final String name;
 final String purpose;
 final String startDate;
 final String endDate;
 final String uuid;
 final String getPercentage;
 final RoadMapTimeLineDatesDataWeek roadMapTimeLineDatesDataWeek;
 final List<RoadMapTimeLineTasksWeek> timeLineTasks ;

 const RoadMapTimeLineSprintsWeek({
  required this.name,
  required this.purpose,
  required this.startDate,
  required this.endDate,
  required this.uuid,
  required this.getPercentage,
  required this.roadMapTimeLineDatesDataWeek,
  required this.timeLineTasks,
});

  @override

  List<Object?> get props =>
      [
       name,
       purpose,
       startDate,
       endDate,
       uuid,
       getPercentage,
       roadMapTimeLineDatesDataWeek,
       timeLineTasks,
      ];



}