import 'package:flutter/material.dart';
import 'package:gofit/features/gofit/presentation/constants/colors.dart';

class SeeAllWorkouts extends StatelessWidget {
  String text;
  SeeAllWorkouts({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        const SizedBox(width: 170),
        Text(
          "See All",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: purple,
          ),
        ),
      ],
    );
  }
}
