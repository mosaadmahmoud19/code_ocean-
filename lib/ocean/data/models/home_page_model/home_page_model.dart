import 'package:code_ocean/ocean/data/models/home_page_model/projects_home_page_model.dart';
import 'package:code_ocean/ocean/domain/entities/home_page/home_page.dart';

class HomePageModel extends HomePageEntities {
  const HomePageModel(
      {

        required super.name,
        required super.isActive,
        required super.projects,
      });

  factory HomePageModel.fromJson(Map<String, dynamic> json)
  {
    return HomePageModel(
      name: json['name'],
      isActive: json['is_active'],
      projects:  List<ProjectHomePageModel>.from(
          json["projects"].map((x) => ProjectHomePageModel.fromJson(x))),
    );
  }
}
