import 'package:code_ocean/core/utils/enums.dart';
import 'package:code_ocean/ocean/domain/entities/road_map_schedule/road_map_schedule.dart';
import 'package:equatable/equatable.dart';

class RoadMapScheduleState extends Equatable
{
  final RequestState stateRoadMapSchedule ;
  final String errorMessage;
  final RoadMapScheduleEntities? roadMapScheduleEntities;

  const RoadMapScheduleState({
    this.stateRoadMapSchedule = RequestState.loading,
    this.errorMessage = '',
    this.roadMapScheduleEntities,
  });

  @override
  List<Object?> get props =>
      [
        stateRoadMapSchedule,
        errorMessage,
        roadMapScheduleEntities,
      ];


  RoadMapScheduleState copyWith({
    RequestState? stateRoadMapSchedule,
    String? errorMessage,
    RoadMapScheduleEntities? roadMapScheduleEntities,
  })
  {
    return RoadMapScheduleState(
      stateRoadMapSchedule:stateRoadMapSchedule ?? this.stateRoadMapSchedule,
      errorMessage: errorMessage ?? this.errorMessage,
      roadMapScheduleEntities: roadMapScheduleEntities ?? this.roadMapScheduleEntities,
    );
  }


}