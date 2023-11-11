
import 'dart:async';

import 'package:code_ocean/core/utils/enums.dart';
import 'package:code_ocean/ocean/domain/usecases/post_id_login_codeocean_usecaes.dart';
import 'package:code_ocean/ocean/presentation/controllers/login_page/codeocean_event.dart';
import 'package:code_ocean/ocean/presentation/controllers/login_page/codeocean_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CodeOceanBloc extends Bloc<CodeOceanEvent , CodeOceanState>
{
  final PostIdLoginCodeOceanUseCase postIdLoginCodeOceanUseCase;

  CodeOceanBloc(this.postIdLoginCodeOceanUseCase) : super(const CodeOceanState())
  {
    on<PostIdLoginCodeOceanEvent>(_postIdLoginCodeOcean);
  }



  FutureOr<void> _postIdLoginCodeOcean(PostIdLoginCodeOceanEvent event, Emitter<CodeOceanState> emit)async
  {
    final result =await postIdLoginCodeOceanUseCase(
      CodeOceanParameters(id: event.loginId)
    );
    
    result.fold((l)
    {
      emit(state.copyWith(
        stateLogin: RequestState.error,
        errorMessage: l.errorMessage,
      ));

    }, (r)
    {
      emit(state.copyWith(
        stateLogin: RequestState.loaded,
        codeOceanLogin: r,
      ));

    });

  }
}