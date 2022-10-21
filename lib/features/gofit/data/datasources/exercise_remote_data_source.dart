import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../../core/errors/failures.dart';
import '../../domain/entities/exercise_entity.dart';
import '../model/exercise_model.dart';

abstract class ExerciseRemoteDataSource {
  Future<Either<Failure, List<ExercisesEntity>>> getExercise();
}

class ExerciseRemoteDataSourceImpl implements ExerciseRemoteDataSource {
  final http.Client client;


  ExerciseRemoteDataSourceImpl({required this.client});

  @override
  Future<Either<Failure, List<ExercisesModel>>> getExercise() async {
    var response = await client.get(
        Uri.parse(
          "http://localhost:3000/exercises",
        ),
        headers: {
          'Content-Type': 'application/json',
        });
    if (response.statusCode == 200) {
      String data = response.body;
      List jsonData = jsonDecode(data);
      var result = jsonData.map((e) => ExercisesModel.fromJson(e)).toList();

      return Right(result);
    } else {
      return const Left(Failure());
    }
    
  }
}
