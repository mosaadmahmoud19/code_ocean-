import 'package:code_ocean/ocean/domain/entities/road_map_week/road_map_time_line_tasks_week.dart';

class RoadMapTimeLineTasksWeekModel extends RoadMapTimeLineTasksWeek {
  const RoadMapTimeLineTasksWeekModel(
      {
      required super.title,
      required super.descriptions,
      required super.percentage,
      required super.uuid});

  factory RoadMapTimeLineTasksWeekModel.fromJson(Map<String, dynamic> json)
  {
    return RoadMapTimeLineTasksWeekModel(
      title: json['title'],
      descriptions: json['descriptions'],
      percentage: json['percentage'],
      uuid: json['uuid'],
    );
  }
}
