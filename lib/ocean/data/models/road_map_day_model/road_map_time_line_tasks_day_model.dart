import 'package:code_ocean/ocean/domain/entities/road_map_day/road_map_time_line_tasks_day.dart';

class RoadMapTimeLineTasksDayModel extends RoadMapTimeLineTasksDay {
  const RoadMapTimeLineTasksDayModel(
      {
        required super.title,
        required super.descriptions,
        required super.percentage,
        required super.uuid,
        required super.date,
        required super.time,
      });

  factory RoadMapTimeLineTasksDayModel.fromJson(Map<String, dynamic> json)
  {
    return RoadMapTimeLineTasksDayModel(
      title: json['title'],
      descriptions: json['descriptions'],
      percentage: json['percentage'],
      uuid: json['uuid'],
      date: json['date'],
      time: json['time'],
    );
  }
}
