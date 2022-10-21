import 'package:dartz/dartz.dart';
import 'package:gofit/core/errors/failures.dart';

import 'package:gofit/features/gofit/domain/entities/exercise_entity.dart';
import 'package:gofit/features/gofit/domain/repositories/exercise_repository.dart';

class GetExercisesUsecase {
  final ExercisesRepository repository;
  GetExercisesUsecase(this.repository);

  Future<Either<Failure, List<ExercisesEntity>>> getExercise() {
    return repository.getExercises();
  }
}
