import 'package:equatable/equatable.dart';

import '../../data/model/exercise_model.dart';

class ExercisesEntity extends Equatable {
  ExercisesEntity({
    required this.exerciseName,
    required this.duration,
    required this.difficulty,
    required this.fullBodyStretchingExercises,
  });

  final String exerciseName;
  final String duration;
  final String difficulty;
  final List<FullBodyStretchingExercise> fullBodyStretchingExercises;

  @override
  List<Object?> get props => [
        exerciseName,
        duration,
        difficulty,
        fullBodyStretchingExercises,
      ];
}
