import 'dart:math';

import 'package:code_ocean/core/error/exceptions.dart';
import 'package:code_ocean/core/network/api_constance.dart';
import 'package:code_ocean/core/network/error_message_data_source.dart';
import 'package:code_ocean/core/printful.dart';
import 'package:code_ocean/ocean/data/models/home_page_model/home_page_model.dart';
import 'package:code_ocean/ocean/data/models/login_model/login_model_model.dart';
import 'package:code_ocean/ocean/data/models/road_map_day_model/road_map_time_line_sprints_day_model.dart';
import 'package:code_ocean/ocean/data/models/road_map_schedule_model/road_map_schedule_project.dart';
import 'package:code_ocean/ocean/data/models/road_map_week_model/road_map_time_line_sprints_week_basic_mdoel.dart';
import 'package:code_ocean/ocean/domain/usecases/get_road_map_schedule_project.dart';
import 'package:code_ocean/ocean/domain/usecases/get_road_map_time_line_day.dart';
import 'package:code_ocean/ocean/domain/usecases/get_road_map_time_line_week.dart';
import 'package:code_ocean/ocean/domain/usecases/post_id_login_codeocean_usecaes.dart';
import 'package:dio/dio.dart';

abstract class BaseCodeOceanRemoteDataSource
{


  Future<HomePageModel> getHomePage();

  Future<RoadMapScheduleModeL> getRoadMapScheduleProject(RoadMapProjectScheduleParameters parameters);

  Future<RoadMapTimeLineSprintsWeekBasicModel> getRoadMapTimeLineWeek(RoadMapTimeLineWeekParameters parameters );

  Future<RoadMapTimeLineSprintsDayModel> getRoadMapTimeLineDay(RoadMapTimeLineDayParameters parameters );

  Future<CodeOceanLoginModel> postLoginDataCodeOcean(CodeOceanParameters parameters);

}

class CodeOceanRemoteDataSource extends BaseCodeOceanRemoteDataSource
{

  @override
  Future<CodeOceanLoginModel> postLoginDataCodeOcean(CodeOceanParameters parameters) async
  {
    final response = await Dio().post(
      ApiConstance.codeOceanLoginId,
      data:
      {
        'uuid' :parameters.id,
      }
    );

    if(response.statusCode ==200)
    {

      return CodeOceanLoginModel.fromJson(response.data);

    }
    else
    {
      print(response.statusMessage.toString());
       throw ServerException(
           errorMessageModel: ErrorMessageModel.fromJson(response.data)
       );
    }
  }



  @override
  Future<HomePageModel> getHomePage() async
  {
    final response = await Dio().get(
      ApiConstance.getHomePage,
    );

    if(response.statusCode ==200)
    {

      return HomePageModel.fromJson(response.data);
    }
    else
    {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data)
      );
    }

  }

  @override
  Future<RoadMapScheduleModeL> getRoadMapScheduleProject(RoadMapProjectScheduleParameters parameters) async
  {
    final response = await Dio().get(
      ApiConstance.getRoadMapSchedule,
      data:
      {
        'uuid_project' : parameters.id,
      }
    );

    if(response.statusCode ==200)
    {

      return RoadMapScheduleModeL.fromJson(response.data);
    }
    else
    {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data)
      );
    }
  }

  @override
  Future<RoadMapTimeLineSprintsWeekBasicModel> getRoadMapTimeLineWeek(RoadMapTimeLineWeekParameters parameters)async
  {
    final response = await Dio().get(
        ApiConstance.getRoadMapTimeLineWeek,
        data:
        {
          'roadmap_uuid' : parameters.id,
        }

    );

    if(response.statusCode ==200)
    {
      return RoadMapTimeLineSprintsWeekBasicModel.fromJson(response.data);
    }
    else
    {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data)
      );
    }
  }

  @override
  Future<RoadMapTimeLineSprintsDayModel> getRoadMapTimeLineDay(RoadMapTimeLineDayParameters parameters)async
  {
    final response = await Dio().get(
        ApiConstance.getRoadMapTimeLineDay,
        data:
        {
          'sprint_uuid' : parameters.id,
        }
    );

    if(response.statusCode ==200)
    {

      return RoadMapTimeLineSprintsDayModel.fromJson(response.data);
    }
    else
    {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data)
      );
    }
  }




}
