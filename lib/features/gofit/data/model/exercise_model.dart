import 'dart:convert';

import '../../domain/entities/exercise_entity.dart';

class ExercisesModel extends ExercisesEntity {
  ExercisesModel({
    required String exerciseName,
    required String duration,
    required String difficulty,
    required List<FullBodyStretchingExercise> fullBodyStretchingExercises,
  }) : super(
            difficulty: difficulty,
            duration: duration,
            exerciseName: exerciseName,
            fullBodyStretchingExercises: fullBodyStretchingExercises);

  factory ExercisesModel.fromRawJson(String str) =>
      ExercisesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ExercisesModel.fromJson(Map<String, dynamic> json) => ExercisesModel(
        exerciseName: json["exerciseName"],
        duration: json["duration"],
        difficulty: json["difficulty"],
        fullBodyStretchingExercises: List<FullBodyStretchingExercise>.from(
            json["fullBodyStretchingExercises"]
                .map((x) => FullBodyStretchingExercise.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "exerciseName": exerciseName,
        "duration": duration,
        "difficulty": difficulty,
        "fullBodyStretchingExercises": List<dynamic>.from(
            fullBodyStretchingExercises.map((x) => x.toJson())),
      };
}

class FullBodyStretchingExercise {
  FullBodyStretchingExercise({
    required this.duration,
    required this.name,
  });

  final String duration;
  final String name;

  factory FullBodyStretchingExercise.fromRawJson(String str) =>
      FullBodyStretchingExercise.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FullBodyStretchingExercise.fromJson(Map<String, dynamic> json) =>
      FullBodyStretchingExercise(
        duration: json["duration"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "duration": duration,
        "name": name,
      };
}
