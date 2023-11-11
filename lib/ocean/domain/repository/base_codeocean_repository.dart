import 'package:code_ocean/core/error/failure.dart';
import 'package:code_ocean/ocean/domain/entities/home_page/home_page.dart';
import 'package:code_ocean/ocean/domain/entities/login/login.dart';
import 'package:code_ocean/ocean/domain/entities/road_map_schedule/road_map_schedule.dart';
import 'package:code_ocean/ocean/domain/entities/road_map_day/road_map_time_line_sprints_day.dart';
import 'package:code_ocean/ocean/domain/entities/road_map_week/road_map_time_line_sprints_week_entities.dart';
import 'package:code_ocean/ocean/domain/usecases/get_road_map_schedule_project.dart';
import 'package:code_ocean/ocean/domain/usecases/get_road_map_time_line_day.dart';
import 'package:code_ocean/ocean/domain/usecases/get_road_map_time_line_week.dart';
import 'package:code_ocean/ocean/domain/usecases/post_id_login_codeocean_usecaes.dart';
import 'package:dartz/dartz.dart';

abstract class BaseCodeOceanRepository
{

  Future<Either<Failure , CodeOceanLogin>> postLoginData(CodeOceanParameters parameters);

  Future<Either<Failure , HomePageEntities>> getHomePage( );

  Future<Either<Failure , RoadMapScheduleEntities>> getRoadMapScheduleProject(RoadMapProjectScheduleParameters parameters);

  Future<Either<Failure ,RoadMapTimeLineSprintsWeekEntities >> getRoadMapTimeLineWeek(RoadMapTimeLineWeekParameters parameters );

  Future<Either<Failure ,RoadMapTimeLineSprintsDay >> getRoadMapTimeLineDay(RoadMapTimeLineDayParameters parameters );




}