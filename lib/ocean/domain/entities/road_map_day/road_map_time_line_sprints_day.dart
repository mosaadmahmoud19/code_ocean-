import 'package:code_ocean/ocean/domain/entities/road_map_day/road_map_time_line_date_data_daydart.dart';
import 'package:code_ocean/ocean/domain/entities/road_map_day/road_map_time_line_tasks_day.dart';
import 'package:equatable/equatable.dart';

class RoadMapTimeLineSprintsDay extends Equatable
{
  final String name;
  final String purpose;
  final String startDate;
  final String endDate;
  final String uuid;
  final String getPercentage;
  final RoadMapTimeLineDatesDataDay roadMapTimeLineDatesDataWeek;
  final List<RoadMapTimeLineTasksDay> timeLineTasks ;

  const RoadMapTimeLineSprintsDay({
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