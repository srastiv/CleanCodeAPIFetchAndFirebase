import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../features/gofit/domain/entities/exercise_entity.dart';
import '../errors/failures.dart';

abstract class Usecase<Type, Params> {
  Future<Either<Failure, List<ExercisesEntity>>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}
