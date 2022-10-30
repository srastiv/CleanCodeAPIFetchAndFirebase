import 'package:flutter/material.dart';
import 'package:gofit/features/gofit/domain/entities/exercise_entity.dart';

import '../../constants/colors.dart';

class ExercisePage extends StatelessWidget {
  ExercisePage(this.data);
  ExercisesEntity data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          data.exerciseName,
          style: TextStyle(color: black),
        ),
      ),
      body: SafeArea(
        child: Container(
          // height: 300,
          width: 300,
          child: ListView.builder(
            itemCount: data.fullBodyStretchingExercises.length,
            itemBuilder: ((context, index) {
              return ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                  ),
                  margin: const EdgeInsets.only(bottom: 10),
                  height: 100,
                  width: 100,
                  child: const Icon(Icons.person),
                ),
                title: Text(
                  data.fullBodyStretchingExercises[index].name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle:
                    Text(data.fullBodyStretchingExercises[index].duration),
              );
            }),
          ),
        ),
      ),
    );
  }
}
