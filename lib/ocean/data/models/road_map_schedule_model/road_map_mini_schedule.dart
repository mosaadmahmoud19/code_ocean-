
import 'package:code_ocean/ocean/domain/entities/road_map_schedule/road_map_mini.dart';

class RoadMapMiniScheduleModel extends RoadMapMiniScheduleEntities {
  const RoadMapMiniScheduleModel(
      {
      required super.id,
      required super.name,
      required super.description,
      required super.projectId,
      required super.uuid,
      required super.percentage,
      required super.date,
      });


  factory RoadMapMiniScheduleModel.fromJson(Map<String, dynamic> json)
  {
    return RoadMapMiniScheduleModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      projectId: json['project_id'],
      uuid: json['uuid'],
      percentage: json['percentage'],
      date: json['date'],



    );
  }
}
