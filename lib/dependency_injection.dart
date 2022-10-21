import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'features/gofit/data/datasources/exercise_remote_data_source.dart';
import 'features/gofit/data/repositories/exercise_repository_impl.dart';
import 'features/gofit/domain/repositories/exercise_repository.dart';
import 'features/gofit/domain/usecases/get_exercises_usecase.dart';
import 'features/gofit/presentation/screens/homepage/bloc/exercise_bloc.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  //* Features - GoFit
  // bloc
  sl.registerFactory(
    () => ExercisesBloc(
      getExercisesUsecase: sl(),
    ),
  );

  // usecase
  sl.registerLazySingleton(() => GetExercisesUsecase(sl()));

  // repository
  sl.registerLazySingleton<ExercisesRepository>(
      () => ExercisesRepositoryImpl(remoteDataSource: sl()));

  // datasources
  sl.registerLazySingleton<ExerciseRemoteDataSource>(
      () => ExerciseRemoteDataSourceImpl(client: sl()));

  sl.registerLazySingleton<http.Client>(() => http.Client());

  //* Core

  //* External
}
