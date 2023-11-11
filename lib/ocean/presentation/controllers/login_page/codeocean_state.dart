import 'package:code_ocean/core/utils/enums.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/login/login.dart';

class CodeOceanState extends Equatable
{
  final RequestState stateLogin ;
  final String errorMessage;
  final CodeOceanLogin? codeOceanLogin;

  const CodeOceanState({
     this.stateLogin = RequestState.loading,
    this.errorMessage = '',
    this.codeOceanLogin,
});

  @override
  List<Object?> get props =>
      [
        stateLogin,
        errorMessage,
        codeOceanLogin,
      ];


  CodeOceanState copyWith({
    RequestState? stateLogin,
     String? errorMessage,
    CodeOceanLogin? codeOceanLogin,
  })
{
  return CodeOceanState(
  stateLogin:stateLogin ?? this.stateLogin,
    errorMessage: errorMessage ?? this.errorMessage,
    codeOceanLogin: codeOceanLogin ?? this.codeOceanLogin,
  );
}


}