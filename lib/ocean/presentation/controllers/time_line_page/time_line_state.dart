import 'package:code_ocean/core/utils/enums.dart';
import 'package:code_ocean/ocean/domain/entities/road_map_day/road_map_time_line_sprints_day.dart';
import 'package:code_ocean/ocean/domain/entities/road_map_week/road_map_time_line_sprints_week_entities.dart';
import 'package:equatable/equatable.dart';

class RoadMapTimeLineState extends Equatable
{
  final RequestState stateRoadMapTimeLine ;
  final String errorMessage;
  final RoadMapTimeLineSprintsWeekEntities? roadMapTimeLineSprintsWeekEntities;
  final RoadMapTimeLineSprintsDay? roadMapTimeLineSprintsDay;

  /// choose the months
  final List<String> months;
  final List<String> years;
  final  String selectedDate ;


  const RoadMapTimeLineState({
    this.stateRoadMapTimeLine = RequestState.loading,
    this.errorMessage = '',
    this.roadMapTimeLineSprintsWeekEntities,
    this.roadMapTimeLineSprintsDay,
    this.months =const [ "January", "February",],
    this.years =const [ "2023", "2024", "2025", "2026","2027"],
    this.selectedDate = "January 2023",
  });

  @override
  List<Object?> get props =>
      [
        stateRoadMapTimeLine,
        errorMessage,
        roadMapTimeLineSprintsWeekEntities,
        roadMapTimeLineSprintsDay,
        months,
        years,
        selectedDate,
      ];


  RoadMapTimeLineState copyWith({
    RequestState? stateRoadMapTimeLine,
    String? errorMessage,
    RoadMapTimeLineSprintsWeekEntities? roadMapTimeLineSprintsWeekEntities,
    RoadMapTimeLineSprintsDay? roadMapTimeLineSprintsDay,

    List<String>? months,
    List<String>? years,
    String? selectedDate ,

  })
  {
    return RoadMapTimeLineState(
      stateRoadMapTimeLine:stateRoadMapTimeLine ?? this.stateRoadMapTimeLine,
      errorMessage: errorMessage ?? this.errorMessage,
      roadMapTimeLineSprintsWeekEntities: roadMapTimeLineSprintsWeekEntities ?? this.roadMapTimeLineSprintsWeekEntities,
      roadMapTimeLineSprintsDay: roadMapTimeLineSprintsDay ?? this.roadMapTimeLineSprintsDay,
      months: months ?? this.months,
      years: years ?? this.years,
      selectedDate: selectedDate ?? this.selectedDate,

    );
  }


}