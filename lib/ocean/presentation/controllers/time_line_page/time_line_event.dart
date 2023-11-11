import 'package:equatable/equatable.dart';

abstract class RoadMapTimeLineEvent extends Equatable {
  const RoadMapTimeLineEvent();
}

class GetRoadMapTimeLineWeekEvent extends RoadMapTimeLineEvent
{
  final String roadmapUuid;

  const GetRoadMapTimeLineWeekEvent({required this.roadmapUuid});

  @override

  List<Object?> get props =>
      [
        roadmapUuid,
      ];

}

class GetRoadMapTimeLineDayEvent extends RoadMapTimeLineEvent
{
  final String sprintUuid;

  const GetRoadMapTimeLineDayEvent({required this.sprintUuid});

  @override

  List<Object?> get props =>
      [
        sprintUuid,
      ];

}


class ToggleSelectData extends RoadMapTimeLineEvent {
  final String selectedDate;

  const ToggleSelectData(this.selectedDate);

  @override
  List<Object> get props => [selectedDate];
}


