import 'package:equatable/equatable.dart';

class RoadMapTimeLineDatesDataDay extends Equatable
{
  final String time;
  final String dayName;
  final String dayDate;

  const RoadMapTimeLineDatesDataDay({
    required this.time,
    required this.dayName,
    required this.dayDate,
  });

  @override

  List<Object?> get props =>
      [
        time,
        dayName,
        dayDate,
      ];
}