
import 'dart:async';

import 'package:code_ocean/core/usecase/base_usecase.dart';
import 'package:code_ocean/core/utils/enums.dart';
import 'package:code_ocean/ocean/domain/usecases/get_home_page.dart';
import 'package:code_ocean/ocean/domain/usecases/post_id_login_codeocean_usecaes.dart';
import 'package:code_ocean/ocean/presentation/controllers/home_page/home_event.dart';
import 'package:code_ocean/ocean/presentation/controllers/home_page/home_state.dart';
import 'package:code_ocean/ocean/presentation/controllers/login_page/codeocean_event.dart';
import 'package:code_ocean/ocean/presentation/controllers/login_page/codeocean_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent , HomeState>
{
  final GetHomePageUseCase getHomePageUseCase;

  HomeBloc(this.getHomePageUseCase) : super(const HomeState())
  {
    on<GetHomePageEvent>(_getHomePage);

    on<ToggleDateEvent>((event, emit) {
      emit(state.copyWith(index: event.index));
    });
  }





  FutureOr<void> _getHomePage(GetHomePageEvent event, Emitter<HomeState> emit)async
  {
    final result =await getHomePageUseCase.call(const NoParameters());

    result.fold((l)
    {
      emit(state.copyWith(
        homeSate: RequestState.error,
        errorMessage: l.errorMessage,
      ));

    }, (r)
    {
      emit(state.copyWith(
        homeSate: RequestState.loaded,
        homePageEntities: r,
      ));

    });
  }
}