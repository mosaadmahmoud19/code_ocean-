import 'package:code_ocean/core/utils/enums.dart';
import 'package:code_ocean/ocean/domain/entities/home_page/home_page.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable
{
  final RequestState homeSate;
  final String errorMessage;
  final HomePageEntities? homePageEntities;

  /// Toggle In Start And End Date
   final String startDate;
   final String endDate;
   final int index;


  const HomeState({
    this.homeSate = RequestState.loading,
    this.errorMessage = '',
    this.homePageEntities,
    this.startDate="1-1-2023",
     this.endDate = "30-5-2025",
    this.index = 0,

  });

  @override
  List<Object?> get props =>
      [
        homeSate,
        errorMessage,
        homePageEntities,
        startDate,
        endDate,
        index,
      ];


  HomeState copyWith({
    RequestState? homeSate,
    String? errorMessage,
    HomePageEntities? homePageEntities,
    String? startDate,
    String? endDate,
    int? index,

  })
  {
    return HomeState(
      homeSate: homeSate ?? this.homeSate,
      errorMessage: errorMessage ?? this.errorMessage,
      homePageEntities: homePageEntities ?? this.homePageEntities,
      startDate: startDate  ?? this.startDate,
      endDate: endDate  ?? this.endDate,
      index: index  ?? this.index,
    );
  }


}