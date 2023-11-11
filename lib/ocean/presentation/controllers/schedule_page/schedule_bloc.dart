
import 'dart:async';

import 'package:code_ocean/core/utils/enums.dart';
import 'package:code_ocean/ocean/domain/usecases/get_road_map_schedule_project.dart';
import 'package:code_ocean/ocean/presentation/controllers/schedule_page/schedule_event.dart';
import 'package:code_ocean/ocean/presentation/controllers/schedule_page/schedule_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoadMapScheduleBloc extends Bloc<RoadMapScheduleEvent , RoadMapScheduleState>
{
  final GetRoadMapScheduleProjectUseCase getRoadMapScheduleProjectUseCase;

  RoadMapScheduleBloc(this.getRoadMapScheduleProjectUseCase) : super(const RoadMapScheduleState())
  {
    on<GetRoadMapScheduleProjectEvent>(_getRoadMapSchedule);
  }




  FutureOr<void> _getRoadMapSchedule(GetRoadMapScheduleProjectEvent event, Emitter<RoadMapScheduleState> emit)async
  {
    final result =await getRoadMapScheduleProjectUseCase(
        RoadMapProjectScheduleParameters(id: event.uuidProject)
    );

    result.fold((l)
    {
      emit(state.copyWith(
        stateRoadMapSchedule: RequestState.error,
        errorMessage: l.errorMessage,
      ));

    }, (r)
    {
      emit(state.copyWith(
        stateRoadMapSchedule: RequestState.loaded,
        roadMapScheduleEntities: r,
      ));

    });

  }
}