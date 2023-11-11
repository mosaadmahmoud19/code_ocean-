import 'package:code_ocean/ocean/data/models/road_map_week_model/road_map_time_line_date_data_week_model.dart';
import 'package:code_ocean/ocean/data/models/road_map_week_model/road_map_time_line_tasks_week_model.dart';
import 'package:code_ocean/ocean/domain/entities/road_map_week/road_map_time_line_sprints_week.dart';

class RoadMapTimeLineSprintsWeekModel extends RoadMapTimeLineSprintsWeek {
  const RoadMapTimeLineSprintsWeekModel(
      {
      required super.name,
      required super.purpose,
      required super.startDate,
      required super.endDate,
      required super.uuid,
      required super.getPercentage,
      required super.roadMapTimeLineDatesDataWeek,
      required super.timeLineTasks,
      });

  factory RoadMapTimeLineSprintsWeekModel.fromJson(Map<String, dynamic> json)
  {
    return RoadMapTimeLineSprintsWeekModel(
      name: json['name'],
      purpose: json['purpose'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      uuid: json['uuid'],
      getPercentage: json['get_percentage'].toString(),
      roadMapTimeLineDatesDataWeek:RoadMapTimeLineDatesDataWeekModel.fromJson( json['dates_data'],),
      timeLineTasks:  List<RoadMapTimeLineTasksWeekModel>.from(
          json["tasks"].map((x) => RoadMapTimeLineTasksWeekModel.fromJson(x))),


    );
  }
}
