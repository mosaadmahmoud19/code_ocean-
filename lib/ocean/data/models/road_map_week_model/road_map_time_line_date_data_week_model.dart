import 'package:code_ocean/ocean/domain/entities/road_map_week/road_map_time_line_date_data_week.dart';

class RoadMapTimeLineDatesDataWeekModel extends RoadMapTimeLineDatesDataWeek {
  const RoadMapTimeLineDatesDataWeekModel(
      {
        required super.time,
        required super.dayName,
        required super.dayDate,
      });

  factory RoadMapTimeLineDatesDataWeekModel.fromJson(Map<String, dynamic> json)
  {
    return RoadMapTimeLineDatesDataWeekModel(
      time: json['time'],
      dayName: json['day_name'],
      dayDate: json['day_date'],

    );
  }
}
