import 'package:code_ocean/core/error/failure.dart';
import 'package:code_ocean/core/usecase/base_usecase.dart';
import 'package:code_ocean/ocean/domain/entities/road_map_day/road_map_time_line_sprints_day.dart';
import 'package:code_ocean/ocean/domain/entities/road_map_week/road_map_time_line_sprints_week_entities.dart';
import 'package:code_ocean/ocean/domain/repository/base_codeocean_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetRoadMapTimeLineDayUseCase extends BaseUseCase<RoadMapTimeLineSprintsDay , RoadMapTimeLineDayParameters >
{
  BaseCodeOceanRepository baseCodeOceanRepository;

  GetRoadMapTimeLineDayUseCase(this.baseCodeOceanRepository);

  @override
  Future<Either<Failure, RoadMapTimeLineSprintsDay>> call(RoadMapTimeLineDayParameters parameters)async
  {
    return baseCodeOceanRepository.getRoadMapTimeLineDay(parameters);

  }




}




class RoadMapTimeLineDayParameters extends Equatable
{
  final String id;

  const RoadMapTimeLineDayParameters({required this.id});

  @override
  List<Object?> get props =>
      [
        id,
      ];

}