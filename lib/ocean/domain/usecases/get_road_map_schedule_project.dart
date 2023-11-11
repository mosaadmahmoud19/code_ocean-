import 'package:code_ocean/core/error/failure.dart';
import 'package:code_ocean/core/usecase/base_usecase.dart';
import 'package:code_ocean/ocean/domain/entities/road_map_schedule/road_map_schedule.dart';
import 'package:code_ocean/ocean/domain/repository/base_codeocean_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetRoadMapScheduleProjectUseCase extends BaseUseCase<RoadMapScheduleEntities , RoadMapProjectScheduleParameters >
{
  BaseCodeOceanRepository baseCodeOceanRepository;

  GetRoadMapScheduleProjectUseCase(this.baseCodeOceanRepository);


  @override
  Future<Either<Failure, RoadMapScheduleEntities>> call(RoadMapProjectScheduleParameters parameters) async
  {
      return baseCodeOceanRepository.getRoadMapScheduleProject(parameters);
  }

}




class RoadMapProjectScheduleParameters extends Equatable
{
  final String id;

  const RoadMapProjectScheduleParameters({required this.id});

  @override
  List<Object?> get props =>
      [
        id,
      ];

}