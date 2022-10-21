import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/exercise_entity.dart';
import '../../domain/repositories/exercise_repository.dart';
import '../datasources/exercise_remote_data_source.dart';

typedef _RemoteExercisesData = Future<ExercisesEntity> Function();

class ExercisesRepositoryImpl implements ExercisesRepository {
  final ExerciseRemoteDataSource remoteDataSource;
  ExercisesRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<ExercisesEntity>>> getExercises() async {
    try {
      final getExercises = await remoteDataSource.getExercise();
      return getExercises.fold((l) => Left(l), (r) => Right(r));
    } on ServerExceptions {
      return Left(
        ServerFailure(),
      );
    }
  }
}
