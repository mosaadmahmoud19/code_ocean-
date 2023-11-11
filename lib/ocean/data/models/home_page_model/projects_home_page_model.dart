import 'package:code_ocean/ocean/domain/entities/home_page/projects_home_page.dart';

class ProjectHomePageModel extends ProjectsHomePageEntities {
  const ProjectHomePageModel(
      {
      required super.name,
      required super.uuid,
      required super.startDate,
      required super.endDate,
      required super.getPercentage,
      });

  factory ProjectHomePageModel.fromJson(Map<String, dynamic> json)
  {
    return ProjectHomePageModel(
      name: json['name'],
      uuid: json['uuid'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      getPercentage: json['get_percentage'],

    );
  }
}
