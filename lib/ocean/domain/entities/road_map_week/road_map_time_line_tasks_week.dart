import 'package:equatable/equatable.dart';

class RoadMapTimeLineTasksWeek extends Equatable
{
 final String title;
 final String descriptions;
 final String percentage;
 final String uuid;

 const RoadMapTimeLineTasksWeek({
   required this.title,
   required this.descriptions,
   required this.percentage,
   required this.uuid,
});

  @override

  List<Object?> get props =>
      [
        title,
        descriptions,
        percentage,
        uuid,

      ];


}