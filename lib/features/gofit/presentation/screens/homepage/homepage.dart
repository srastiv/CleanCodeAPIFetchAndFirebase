import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../dependency_injection.dart';
import '../../constants/colors.dart';
import '../../widgets/bottom_nav_bar.dart';
import '../exercisepage/exercise_page.dart';
import 'bloc/exercise_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => sl<ExercisesBloc>(),
          child: BlocBuilder<ExercisesBloc, ExercisesState>(
            builder: (context, state) {
              if (state is ExercisesInitialState) {
                BlocProvider.of<ExercisesBloc>(context)
                    .add(FetchExerciseEvent());
                return const Center(
                  child: Text(
                    "Initial State",
                    style: TextStyle(color: Colors.red),
                  ),
                );
              } else if (state is ExerciseLoadedState) {
                return Container(
                  padding: const EdgeInsets.all(15),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: purple,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Icons.sports_gymnastics,
                                  color: Colors.white,
                                )),
                            SizedBox(width: 20),
                            Text("GoFit"),
                            SizedBox(width: 180),
                            Icon(Icons.notifications_active_outlined),
                            SizedBox(width: 20),
                            Icon(Icons.bookmark_outline),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Morning, Christina",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Text(
                              "Featured Workout",
                              style: TextStyle(
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
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 240,
                          child: ListView.builder(
                            padding: const EdgeInsets.all(0),
                            shrinkWrap: true,
                            itemCount: state.exercises.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: ((context, index) {
                              return GestureDetector(
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      top: 5, bottom: 25, left: 5, right: 5),
                                  margin: const EdgeInsets.only(
                                      right: 10, bottom: 10),
                                  width: 240,
                                  height: 240,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.exercises[index].exerciseName,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            " ${state.exercises[index].duration} | ${state.exercises[index].difficulty} ",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          // const SizedBox(width: ),
                                          const Icon(Icons.bookmark_outline,
                                              color: Colors.white),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ExercisePage(),
                                    ),
                                  );
                                },
                              );
                            }),
                          ),
                        ),
                        Row(
                          children: [
                            const Text(
                              "Workout Levels",
                              style: TextStyle(
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
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 60,
                          child: ListView.builder(
                            padding: const EdgeInsets.all(0),
                            shrinkWrap: true,
                            itemCount: state.exercises.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: ((context, index) {
                              return GestureDetector(
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      top: 5, bottom: 5, left: 5, right: 5),
                                  margin: const EdgeInsets.only(
                                      right: 10, bottom: 10),
                                  decoration: BoxDecoration(
                                      color: purple,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        " ${state.exercises[index].duration} | ${state.exercises[index].difficulty} ",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ExercisePage(),
                                    ),
                                  );
                                },
                              );
                            }),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ListView.builder(
                          padding: const EdgeInsets.all(0),
                          shrinkWrap: true,
                          itemCount: state.exercises.length,
                          scrollDirection: Axis.vertical,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: ((context, index) {
                            return GestureDetector(
                              child: Container(
                                padding: const EdgeInsets.only(
                                    top: 5, bottom: 25, left: 5, right: 5),
                                margin: const EdgeInsets.only(
                                    right: 10, bottom: 10),
                                width: 150,
                                height: 110,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.exercises[index].exerciseName,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          " ${state.exercises[index].duration} | ${state.exercises[index].difficulty} ",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(width: 120),
                                        const Icon(Icons.bookmark_outline,
                                            color: Colors.white),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ExercisePage(),
                                  ),
                                );
                              },
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                );
              } else if (state is ExerciseErrorState) {
                return Center(
                  child: Text(state.message),
                );
              }
              return const Center(
                child: Text("neither error not initial not loaded"),
              );
            },
          ),
        ),
      ),
    );
  }
}
