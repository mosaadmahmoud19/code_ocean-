import 'package:equatable/equatable.dart';

class RoadMapMiniScheduleEntities extends Equatable
{
  final int id;
  final String name;
  final String description;
  final int projectId;
  final String uuid;
  final String percentage;
  final String date;

  const RoadMapMiniScheduleEntities({
    required this.id,
    required this.name,
    required this.description,
    required this.projectId,
    required this.uuid,
    required this.date,
    required this.percentage,


});

  @override

  List<Object?> get props =>
      [
        id,
        name,
        description,
        projectId,
        uuid,
        date,
        percentage,

      ];
}