// import 'dart:async';
//
// import 'package:code_ocean/core/usecase/base_usecase.dart';
// import 'package:code_ocean/core/utils/enums.dart';
// import 'package:code_ocean/ocean/presentation/controllers/task_details_event.dart';
// import 'package:code_ocean/ocean/presentation/controllers/task_details_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class TaskDetailsBloc extends Bloc<TaskDetailsEvent , TaskDetailsState>
// {
//   final TaskDetailsUseCase taskDetailsUseCase;
//
//   TaskDetailsBloc(this.taskDetailsUseCase) : super( const TaskDetailsState())
//   {
//     on<GetTaskDetailsEvent>(_getTaskDetailsEvent);
//
//     on<ToggleDateEvent>((event, emit) {
//       emit(state.copyWith(index: event.index));
//     });
//
//   }
//
//
//
//   FutureOr<void> _getTaskDetailsEvent(GetTaskDetailsEvent event, Emitter<TaskDetailsState> emit)async
//   {
//     final result =await taskDetailsUseCase(const NoParameters());
//
//     result.fold((l)
//     {
//       emit(state.copyWith(
//         stateLogin: RequestState.error,
//         errorMessage: l.errorMessage,
//       ));
//
//     }, (r)
//     {
//       emit(state.copyWith(
//         stateLogin: RequestState.loaded,
//        taskDetailsEntities:r,
//       ));
//
//     });
//   }
// }
