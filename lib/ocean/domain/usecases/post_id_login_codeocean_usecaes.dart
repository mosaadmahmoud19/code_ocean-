import 'package:code_ocean/core/error/failure.dart';
import 'package:code_ocean/core/usecase/base_usecase.dart';
import 'package:code_ocean/ocean/domain/entities/login/login.dart';
import 'package:code_ocean/ocean/domain/repository/base_codeocean_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class PostIdLoginCodeOceanUseCase extends BaseUseCase< CodeOceanLogin , CodeOceanParameters>
{
  BaseCodeOceanRepository baseCodeOceanRepository;

  PostIdLoginCodeOceanUseCase(this.baseCodeOceanRepository);

  @override
  Future<Either<Failure, CodeOceanLogin>> call(CodeOceanParameters parameters) {
    return  baseCodeOceanRepository.postLoginData(parameters);
  }





}

class CodeOceanParameters extends Equatable
{
  final String id;

  const CodeOceanParameters({required this.id});

  @override
  List<Object?> get props => [id];

}