import 'package:code_ocean/ocean/data/models/road_map_week_model/road_map_time_line_sprints_week_model.dart';
import 'package:code_ocean/ocean/domain/entities/road_map_week/road_map_time_line_sprints_week_entities.dart';

class RoadMapTimeLineSprintsWeekBasicModel
    extends RoadMapTimeLineSprintsWeekEntities {
  const RoadMapTimeLineSprintsWeekBasicModel(
      {
      required super.name,
      required super.description,
      required super.getPercentage,
      required super.startDate,
      required super.endDate,
      required super.sprints,
      });
  factory RoadMapTimeLineSprintsWeekBasicModel.fromJson(Map<String, dynamic> json)
  {
    return RoadMapTimeLineSprintsWeekBasicModel(
      name: json['name'],
      description: json['description'],
      getPercentage: json['get_percentage'],
      startDate: json['start_date'],
      endDate: json['end_date'],

      sprints: List<RoadMapTimeLineSprintsWeekModel>.from(
          json["sprints"].map((x) => RoadMapTimeLineSprintsWeekModel.fromJson(x))),


    );
  }
}
