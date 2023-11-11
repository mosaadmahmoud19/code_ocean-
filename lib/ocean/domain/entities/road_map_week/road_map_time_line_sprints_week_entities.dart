import 'package:code_ocean/ocean/domain/entities/road_map_week/road_map_time_line_sprints_week.dart';
import 'package:equatable/equatable.dart';

class RoadMapTimeLineSprintsWeekEntities extends Equatable
{
 final String name;
 final String description;
 final String getPercentage;
 final String startDate;
 final String endDate;
 final List<RoadMapTimeLineSprintsWeek> sprints;

 const RoadMapTimeLineSprintsWeekEntities({
  required this.name,
  required this.description,
  required this.getPercentage,
  required this.startDate,
  required this.endDate,
  required this.sprints,
});



  @override

  List<Object?> get props =>
      [
       name,
       description,
       getPercentage,
       startDate,
       endDate,
       sprints,

      ];


}