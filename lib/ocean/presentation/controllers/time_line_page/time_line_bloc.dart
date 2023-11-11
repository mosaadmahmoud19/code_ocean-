
import 'dart:async';

import 'package:code_ocean/core/utils/enums.dart';
import 'package:code_ocean/ocean/domain/usecases/get_road_map_time_line_day.dart';
import 'package:code_ocean/ocean/domain/usecases/get_road_map_time_line_week.dart';
import 'package:code_ocean/ocean/presentation/controllers/time_line_page/time_line_event.dart';
import 'package:code_ocean/ocean/presentation/controllers/time_line_page/time_line_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoadMapTimeLineBloc extends Bloc<RoadMapTimeLineEvent , RoadMapTimeLineState>
{
  final GetRoadMapTimeLineWeekUseCase getRoadMapTimeLineWeekUseCase;
  final GetRoadMapTimeLineDayUseCase getRoadMapTimeLineDayUseCase;


  RoadMapTimeLineBloc(
      this.getRoadMapTimeLineWeekUseCase,
      this.getRoadMapTimeLineDayUseCase,
      ) : super(const RoadMapTimeLineState())
  {
    on<GetRoadMapTimeLineWeekEvent>(_getRoadMapTimeLineWeekEvent);

    on<GetRoadMapTimeLineDayEvent>(_getRoadMapTimeLineDayEvent);



    on<ToggleSelectData>((event, emit) {
      emit(state.copyWith(selectedDate: event.selectedDate));
    });
  }







  FutureOr<void> _getRoadMapTimeLineWeekEvent(GetRoadMapTimeLineWeekEvent event, Emitter<RoadMapTimeLineState> emit) async
  {
    {
      final result =await getRoadMapTimeLineWeekUseCase(
          RoadMapTimeLineWeekParameters(id: event.roadmapUuid)
      );

      result.fold((l)
      {
        emit(state.copyWith(
          stateRoadMapTimeLine: RequestState.error,
          errorMessage: l.errorMessage,
        ));

      }, (r)
      {
        emit(state.copyWith(
          stateRoadMapTimeLine: RequestState.loaded,
          roadMapTimeLineSprintsWeekEntities: r,
        ));

      });

    }
  }

  FutureOr<void> _getRoadMapTimeLineDayEvent(GetRoadMapTimeLineDayEvent event, Emitter<RoadMapTimeLineState> emit)async
  {
    {
      final result =await getRoadMapTimeLineDayUseCase(
          RoadMapTimeLineDayParameters(id: event.sprintUuid)
      );

      result.fold((l)
      {
        emit(state.copyWith(
          stateRoadMapTimeLine: RequestState.error,
          errorMessage: l.errorMessage,
        ));

      }, (r)
      {
        emit(state.copyWith(
          stateRoadMapTimeLine: RequestState.loaded,
          roadMapTimeLineSprintsDay: r,
        ));

      });

    }
  }
}