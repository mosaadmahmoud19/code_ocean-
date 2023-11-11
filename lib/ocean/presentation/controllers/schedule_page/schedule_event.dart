import 'package:equatable/equatable.dart';

abstract class RoadMapScheduleEvent extends Equatable {
  const RoadMapScheduleEvent();
}

class GetRoadMapScheduleProjectEvent extends RoadMapScheduleEvent
{
  final String uuidProject;

  const GetRoadMapScheduleProjectEvent({required this.uuidProject});

  @override

  List<Object?> get props =>
      [
        uuidProject,
      ];

}


