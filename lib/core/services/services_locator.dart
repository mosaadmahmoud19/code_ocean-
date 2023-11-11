import 'package:code_ocean/ocean/data/datasource/codeocean_remote_data_source.dart';
import 'package:code_ocean/ocean/data/repository/codeocean_repository.dart';
import 'package:code_ocean/ocean/domain/repository/base_codeocean_repository.dart';
import 'package:code_ocean/ocean/domain/usecases/get_home_page.dart';
import 'package:code_ocean/ocean/domain/usecases/get_road_map_schedule_project.dart';
import 'package:code_ocean/ocean/domain/usecases/get_road_map_time_line_day.dart';
import 'package:code_ocean/ocean/domain/usecases/get_road_map_time_line_week.dart';
import 'package:code_ocean/ocean/domain/usecases/post_id_login_codeocean_usecaes.dart';
import 'package:code_ocean/ocean/presentation/controllers/home_page/home_bloc.dart';
import 'package:code_ocean/ocean/presentation/controllers/login_page/codeocean_bloc.dart';
import 'package:code_ocean/ocean/presentation/controllers/schedule_page/schedule_bloc.dart';
import 'package:code_ocean/ocean/presentation/controllers/task_details_bloc.dart';
import 'package:code_ocean/ocean/presentation/controllers/time_line_page/time_line_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /// Bloc
    // sl.registerFactory(() => TaskDetailsBloc( sl()));
    sl.registerFactory(() => CodeOceanBloc( sl()));
    sl.registerFactory(() => HomeBloc( sl()));
    sl.registerFactory(() => RoadMapScheduleBloc( sl()));
    sl.registerFactory(() => RoadMapTimeLineBloc( sl(), sl()));

    /// Use Cases
    sl.registerLazySingleton(() => PostIdLoginCodeOceanUseCase(sl()));
    sl.registerLazySingleton(() => GetHomePageUseCase(sl()));
    sl.registerLazySingleton(() => GetRoadMapScheduleProjectUseCase(sl()));
    sl.registerLazySingleton(() => GetRoadMapTimeLineWeekUseCase(sl()));
    sl.registerLazySingleton(() => GetRoadMapTimeLineDayUseCase(sl()));


    /// Repository
    sl.registerLazySingleton<BaseCodeOceanRepository>(
            () => CodeOceanRepository(sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<BaseCodeOceanRemoteDataSource>(
            () => CodeOceanRemoteDataSource());


  }
}