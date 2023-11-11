import 'package:code_ocean/ocean/data/models/road_map_day_model/road_map_time_line_date_data_day_model.dart';
import 'package:code_ocean/ocean/data/models/road_map_day_model/road_map_time_line_tasks_day_model.dart';
import 'package:code_ocean/ocean/domain/entities/road_map_day/road_map_time_line_sprints_day.dart';

class RoadMapTimeLineSprintsDayModel extends RoadMapTimeLineSprintsDay {
  const RoadMapTimeLineSprintsDayModel(
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

  factory RoadMapTimeLineSprintsDayModel.fromJson(Map<String, dynamic> json)
  {
    return RoadMapTimeLineSprintsDayModel(
      name: json['name'],
      purpose: json['purpose'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      uuid: json['uuid'],
      getPercentage: json['get_percentage'],
      roadMapTimeLineDatesDataWeek:RoadMapTimeLineDatesDataDayModel.fromJson( json['dates_data'],),
      timeLineTasks:  List<RoadMapTimeLineTasksDayModel>.from(
          json["tasks"].map((x) => RoadMapTimeLineTasksDayModel.fromJson(x))),


    );
  }
}
