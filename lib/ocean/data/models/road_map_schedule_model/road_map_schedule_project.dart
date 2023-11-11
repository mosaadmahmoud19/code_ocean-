import 'package:code_ocean/ocean/data/models/road_map_schedule_model/road_map_mini_schedule.dart';
import 'package:code_ocean/ocean/domain/entities/road_map_schedule/road_map_schedule.dart';

class RoadMapScheduleModeL extends RoadMapScheduleEntities {
  const RoadMapScheduleModeL(
      {
      required super.name,
      required super.uuid,
      required super.startDate,
      required super.endDate,
      required super.getPercentage,
      required super.roadMapMini,
      });

  factory RoadMapScheduleModeL.fromJson(Map<String, dynamic> json)
  {
    return RoadMapScheduleModeL(
      name: json['name'],
      uuid: json['uuid'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      getPercentage: json['get_percentage'],
      roadMapMini:  List<RoadMapMiniScheduleModel>.from(
          json["road_map_mini"].map((x) => RoadMapMiniScheduleModel.fromJson(x))),
    );
  }


}
