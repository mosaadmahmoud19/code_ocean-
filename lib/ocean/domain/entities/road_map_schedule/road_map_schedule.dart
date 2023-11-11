import 'package:code_ocean/ocean/domain/entities/road_map_schedule/road_map_mini.dart';
import 'package:equatable/equatable.dart';

class RoadMapScheduleEntities extends Equatable {
  final String name;
  final String uuid;
  final String startDate;
  final String endDate;
  final String getPercentage;
  final List<RoadMapMiniScheduleEntities>roadMapMini;

  const RoadMapScheduleEntities({
    required this.name,
    required this.uuid,
    required this.startDate,
    required this.endDate,
    required this.getPercentage,
    required this.roadMapMini,

  });

  @override
  List<Object> get props => [
    name,
    uuid,
    startDate,
    endDate,
    getPercentage,

  ];
}
