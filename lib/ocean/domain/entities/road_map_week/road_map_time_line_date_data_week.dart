import 'package:equatable/equatable.dart';

class RoadMapTimeLineDatesDataWeek extends Equatable
{
 final String time;
 final String dayName;
 final String dayDate;

 const RoadMapTimeLineDatesDataWeek({
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