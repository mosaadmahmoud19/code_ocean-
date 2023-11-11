import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable
{
  const HomeEvent();
  @override
  List<Object?> get props => [];

}

class GetHomePageEvent extends HomeEvent {}


 class ToggleDateEvent extends HomeEvent {
  final int index;

  const ToggleDateEvent(this.index);

  @override
  List<Object> get props => [index];
 }