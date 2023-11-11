import 'package:code_ocean/core/error/exceptions.dart';
import 'package:code_ocean/core/error/failure.dart';
import 'package:code_ocean/ocean/data/datasource/codeocean_remote_data_source.dart';
import 'package:code_ocean/ocean/domain/entities/home_page/home_page.dart';
import 'package:code_ocean/ocean/domain/entities/login/login.dart';
import 'package:code_ocean/ocean/domain/entities/road_map_schedule/road_map_schedule.dart';
import 'package:code_ocean/ocean/domain/entities/road_map_day/road_map_time_line_sprints_day.dart';
import 'package:code_ocean/ocean/domain/entities/road_map_week/road_map_time_line_sprints_week_entities.dart';
import 'package:code_ocean/ocean/domain/repository/base_codeocean_repository.dart';
import 'package:code_ocean/ocean/domain/usecases/get_road_map_schedule_project.dart';
import 'package:code_ocean/ocean/domain/usecases/get_road_map_time_line_day.dart';
import 'package:code_ocean/ocean/domain/usecases/get_road_map_time_line_week.dart';
import 'package:code_ocean/ocean/domain/usecases/post_id_login_codeocean_usecaes.dart';
import 'package:dartz/dartz.dart';

class CodeOceanRepository extends BaseCodeOceanRepository
{
  BaseCodeOceanRemoteDataSource baseCodeOceanRemoteDataSource;

  CodeOceanRepository(this.baseCodeOceanRemoteDataSource);

  @override
  Future<Either<Failure, CodeOceanLogin>> postLoginData(CodeOceanParameters parameters)async
  {
    final result = await baseCodeOceanRemoteDataSource.postLoginDataCodeOcean(parameters);

    try
    {
      return Right(result);
    } on ServerException catch(failure)
    {
      return left(ServerFailure(failure.errorMessageModel.errorMessage));
    }

  }


  @override
  Future<Either<Failure, HomePageEntities>> getHomePage()async
  {
    final result = await baseCodeOceanRemoteDataSource.getHomePage();

    try
    {
      return Right(result);
    } on ServerException catch(failure)
    {
      return left(ServerFailure(failure.errorMessageModel.errorMessage));
    }


  }

  @override
  Future<Either<Failure, RoadMapScheduleEntities>> getRoadMapScheduleProject(RoadMapProjectScheduleParameters parameters) async
  {
    final result = await baseCodeOceanRemoteDataSource.getRoadMapScheduleProject(parameters);

    try
    {
      return Right(result);
    } on ServerException catch(failure)
    {
      return left(ServerFailure(failure.errorMessageModel.errorMessage));
    }

  }

  @override
  Future<Either<Failure, RoadMapTimeLineSprintsWeekEntities>> getRoadMapTimeLineWeek(RoadMapTimeLineWeekParameters parameters)async
  {
    final result = await baseCodeOceanRemoteDataSource.getRoadMapTimeLineWeek(parameters);

    try
    {
      return Right(result);
    } on ServerException catch(failure)
    {
      return left(ServerFailure(failure.errorMessageModel.errorMessage));
    }

  }

  @override
  Future<Either<Failure, RoadMapTimeLineSprintsDay>> getRoadMapTimeLineDay(RoadMapTimeLineDayParameters parameters) async
  {
    final result = await baseCodeOceanRemoteDataSource.getRoadMapTimeLineDay(parameters);

    try
    {
      return Right(result);
    } on ServerException catch(failure)
    {
      return left(ServerFailure(failure.errorMessageModel.errorMessage));
    }

  }





}