import 'package:flutter/material.dart';
import 'package:gofit/features/gofit/domain/entities/exercise_entity.dart';
import 'package:gofit/features/gofit/presentation/constants/colors.dart';
import 'package:gofit/features/gofit/presentation/screens/exercisepage/exercise_page.dart';

class VerticalListViewBuilderChild extends StatelessWidget {
  VerticalListViewBuilderChild({
    required this.duration,
    required this.difficulty,
    required this.exerciseName,
    required this.data,
    Key? key,
  }) : super(key: key);
  String duration;
  String difficulty;
  String exerciseName;
  ExercisesEntity data;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.only(top: 5, bottom: 25, left: 15, right: 15),
        margin: const EdgeInsets.only(right: 10, bottom: 10),
        width: 150,
        height: 110,
        decoration:
            BoxDecoration(color: grey, borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              exerciseName,
              style: const TextStyle(
                  color: white, fontWeight: FontWeight.w700, fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$duration | $difficulty",
                  style: const TextStyle(
                    color: white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Icon(Icons.bookmark_outline, color: white),
              ],
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ExercisePage(data),
          ),
        );
      },
    );
  }
}

class WorkoutLevelsListViewBuilder extends StatelessWidget {
  WorkoutLevelsListViewBuilder({
    Key? key,
    required this.difficulty,
    required this.duration,
  }) : super(key: key);
  String duration;
  String difficulty;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
        margin: const EdgeInsets.only(right: 10, bottom: 10),
        decoration: BoxDecoration(
          color: purple,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              " $duration | $difficulty ",
              style: const TextStyle(color: white),
            ),
          ],
        ),
      ),
      onTap: () {},
    );
  }
}

class HorizontalListViewChild extends StatelessWidget {
  HorizontalListViewChild({
    Key? key,
    required this.difficulty,
    required this.duration,
    required this.exerciseName,
    required this.exercise,
  }) : super(key: key);

  String exerciseName;
  String duration;
  String difficulty;
  ExercisesEntity exercise;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.only(top: 5, bottom: 25, left: 5, right: 5),
        margin: const EdgeInsets.only(right: 15, bottom: 10),
        width: 240,
        height: 240,
        decoration:
            BoxDecoration(color: grey, borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              exerciseName,
              style: const TextStyle(
                  color: white, fontWeight: FontWeight.w700, fontSize: 20),
            ),
            Row(
              children: [
                Text(
                  " $duration | $difficulty ",
                  style: const TextStyle(
                    color: white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Icon(Icons.bookmark_outline, color: white),
              ],
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ExercisePage(
              exercise,
            ),
          ),
        );
      },
    );
  }
}
