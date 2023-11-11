import 'package:code_ocean/core/error/failure.dart';
import 'package:code_ocean/core/usecase/base_usecase.dart';
import 'package:code_ocean/ocean/domain/entities/road_map_week/road_map_time_line_sprints_week_entities.dart';
import 'package:code_ocean/ocean/domain/repository/base_codeocean_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetRoadMapTimeLineWeekUseCase extends BaseUseCase<RoadMapTimeLineSprintsWeekEntities , RoadMapTimeLineWeekParameters >
{
  BaseCodeOceanRepository baseCodeOceanRepository;

  GetRoadMapTimeLineWeekUseCase(this.baseCodeOceanRepository);


  @override
  Future<Either<Failure, RoadMapTimeLineSprintsWeekEntities>> call(RoadMapTimeLineWeekParameters parameters) async
  {
    return baseCodeOceanRepository.getRoadMapTimeLineWeek( parameters);

  }

}




class RoadMapTimeLineWeekParameters extends Equatable
{
  final String id;

  const RoadMapTimeLineWeekParameters({required this.id});

  @override
  List<Object?> get props =>
      [
        id,
      ];

}