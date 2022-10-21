import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/exercise_entity.dart';
import '../../../../domain/usecases/get_exercises_usecase.dart';

part 'exercise_event.dart';
part 'exercise_state.dart';

const String serverFailureMessage = "SERVER FAILURE";

class ExercisesBloc extends Bloc<ExerciseEvent, ExercisesState> {
  final GetExercisesUsecase getExercisesUsecase;

  ExercisesBloc({
    required this.getExercisesUsecase,
  }) : super(ExercisesInitialState()) {
    on<FetchExerciseEvent>((event, emit) async {
      final exercises = await getExercisesUsecase.getExercise();

      exercises.fold(
          (failure) => emit(
                ExerciseErrorState(message: "error message from bloc"),
              ),
          (exercises) => emit(ExerciseLoadedState(exercises: exercises)));
    });
  }
}
