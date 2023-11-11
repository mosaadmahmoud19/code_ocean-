// import 'package:code_ocean/core/utils/enums.dart';
// import 'package:code_ocean/ocean/domain/entities/home_page/projects_home_page.dart';
// import 'package:code_ocean/ocean/domain/entities/road_map.dart';
// import 'package:code_ocean/ocean/domain/entities/sprints.dart';
// import 'package:code_ocean/ocean/domain/entities/task_details.dart';
// import 'package:equatable/equatable.dart';
//
// class TaskDetailsState extends Equatable
// {
//   final RequestState stateLogin ;
//   final String errorMessage;
//   final TaskDetailsEntities? taskDetailsEntities;
//   final List<ProjectsHomePageEntities> projects;
//   final List<RoadMap> roadMap;
//   final List<Sprints> sprints;
//   /// Toggle In Start And End Date
//   final String? startDate;
//   final String endDate;
//   final int index;
//
//
//   const TaskDetailsState({
//     this.stateLogin = RequestState.loading,
//     this.errorMessage = '',
//     this.taskDetailsEntities,
//     this.projects = const [],
//     this.roadMap = const [],
//     this.sprints =const  [],
//     this.startDate="1-1-2023",
//     this.endDate = "30-5-2025",
//     this.index = 0,
//
//   });
//
//   @override
//   List<Object?> get props =>
//       [
//         stateLogin,
//         errorMessage,
//         taskDetailsEntities,
//         projects,
//         roadMap,
//         sprints,
//         startDate,
//         endDate,
//         index,
//       ];
//
//
//   TaskDetailsState copyWith({
//     RequestState? stateLogin,
//     TaskDetailsEntities? taskDetailsEntities,
//     String? errorMessage,
//      List<ProjectsHomePageEntities>? projects,
//      List<RoadMap>? roadMap,
//      List<Sprints>? sprints,
//      String? startDate,
//      String? endDate,
//      int? index,
//
//   })
//   {
//     return TaskDetailsState(
//       stateLogin:stateLogin ?? this.stateLogin,
//       errorMessage: errorMessage ?? this.errorMessage,
//       taskDetailsEntities: taskDetailsEntities ?? this.taskDetailsEntities,
//       projects: projects  ?? this.projects,
//       roadMap: roadMap  ?? this.roadMap,
//       sprints: sprints  ?? this.sprints,
//       startDate: startDate  ?? this.startDate,
//       endDate: endDate  ?? this.endDate,
//       index: index  ?? this.index,
//     );
//   }
//
//
// }