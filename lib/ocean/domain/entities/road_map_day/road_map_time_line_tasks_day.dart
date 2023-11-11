import 'package:equatable/equatable.dart';

class RoadMapTimeLineTasksDay extends Equatable
{
  final String title;
  final String descriptions;
  final String percentage;
  final String uuid;
  final String date;
  final String time;

  const RoadMapTimeLineTasksDay({
    required this.title,
    required this.descriptions,
    required this.percentage,
    required this.uuid,
    required this.date,
    required this.time,
  });

  @override

  List<Object?> get props =>
      [
        title,
        descriptions,
        percentage,
        uuid,
        date,
        time,

      ];


}