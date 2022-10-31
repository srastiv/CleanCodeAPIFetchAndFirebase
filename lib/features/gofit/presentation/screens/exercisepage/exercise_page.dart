import 'package:flutter/material.dart';
import 'package:gofit/features/gofit/presentation/screens/homepage/widgets/listview_builder.dart';
import 'package:gofit/features/gofit/presentation/screens/homepage/widgets/see_all.dart';

import '../../../domain/entities/exercise_entity.dart';
import '../../constants/colors.dart';

class ExercisePage extends StatelessWidget {
  ExercisePage(this.data);
  ExercisesEntity data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Icon(
                  Icons.person,
                  size: 200,
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Text(
                    data.exerciseName,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 40,
                    child: ListView.builder(
                      padding: const EdgeInsets.all(0),
                      shrinkWrap: true,
                      itemCount: data.difficulty.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) {
                        return WorkoutLevelsListViewBuilder(
                          duration: data.duration,
                          difficulty: data.difficulty,
                        );
                      }),
                    ),
                  ),
                  const SizedBox(height: 15),
                  SeeAllWorkouts(
                    text: "Workout Activity",
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
            Expanded(
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
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 50,
        width: 300,
        decoration: const BoxDecoration(),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: purple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: () {},
          child: const Text("START"),
        ),
      ),
    );
  }
}
