import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/exercise_entity.dart';

abstract class ExercisesRepository {
  Future<Either<Failure, List<ExercisesEntity>>> getExercises();
}
