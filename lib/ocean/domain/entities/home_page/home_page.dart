import 'package:code_ocean/ocean/domain/entities/home_page/projects_home_page.dart';
import 'package:equatable/equatable.dart';

class HomePageEntities extends Equatable
{
  final String name;
  final bool isActive;
  final List<ProjectsHomePageEntities> projects;

 const HomePageEntities(
  {
   required this.name,
   required this.isActive,
    required this.projects
  });

  @override

  List<Object?> get props =>
      [
        name,
        isActive,
        projects,
      ];
}