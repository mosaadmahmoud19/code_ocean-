import 'package:equatable/equatable.dart';

class ProjectsHomePageEntities extends Equatable {
  final String name;
  final String uuid;
  final String startDate;
  final String endDate;
  final String getPercentage;

  const ProjectsHomePageEntities({
    required this.name,
    required this.uuid,
    required this.startDate,
    required this.endDate,
    required this.getPercentage,

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
