part of 'exercise_bloc.dart';

abstract class ExercisesState extends Equatable {
  const ExercisesState();

  @override
  List<Object> get props => [];
}

class ExercisesInitialState extends ExercisesState {}

class ExerciseLoadedState extends ExercisesState {
  final List<ExercisesEntity> exercises;
  const ExerciseLoadedState({required this.exercises}) : super();
}

class ExerciseErrorState extends ExercisesState {
  String message;
  ExerciseErrorState({required this.message});
}
