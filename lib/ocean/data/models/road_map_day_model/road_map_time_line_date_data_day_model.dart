import 'package:code_ocean/ocean/domain/entities/road_map_day/road_map_time_line_date_data_daydart.dart';

class RoadMapTimeLineDatesDataDayModel extends RoadMapTimeLineDatesDataDay {
  const RoadMapTimeLineDatesDataDayModel(
      {
        required super.time,
        required super.dayName,
        required super.dayDate,
      });

  factory RoadMapTimeLineDatesDataDayModel.fromJson(Map<String, dynamic> json)
  {
    return RoadMapTimeLineDatesDataDayModel(
      time: json['time'],
      dayName: json['day_name'],
      dayDate: json['day_date'],

    );
  }
}
