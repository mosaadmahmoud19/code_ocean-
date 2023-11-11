import 'package:code_ocean/core/error/failure.dart';
import 'package:code_ocean/core/usecase/base_usecase.dart';
import 'package:code_ocean/ocean/domain/entities/home_page/home_page.dart';
import 'package:code_ocean/ocean/domain/repository/base_codeocean_repository.dart';
import 'package:dartz/dartz.dart';

class GetHomePageUseCase extends BaseUseCase<HomePageEntities, NoParameters>
{
  BaseCodeOceanRepository baseCodeOceanRepository;

  GetHomePageUseCase(this.baseCodeOceanRepository);


  @override
  Future<Either<Failure, HomePageEntities>> call(NoParameters parameters)async
  {

  return await baseCodeOceanRepository.getHomePage();

  }

}