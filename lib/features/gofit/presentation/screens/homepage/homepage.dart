import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../dependency_injection.dart';
import '../../constants/colors.dart';
import '../../widgets/bottom_nav_bar.dart';
import 'bloc/exercise_bloc.dart';
import 'widgets/listview_builder.dart';
import 'widgets/see_all.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
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
                    style: TextStyle(color: red),
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
                                child: const Icon(
                                  Icons.sports_gymnastics,
                                  color: white,
                                )),
                            const SizedBox(width: 20),
                            const Text(
                              "GoFit",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 180),
                            const Icon(Icons.notifications_active_outlined),
                            const SizedBox(width: 20),
                            const Icon(Icons.bookmark_outline),
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
                        SeeAllWorkouts(
                          text: "Featured Workout",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 240,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.exercises.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: ((context, index) {
                              return HorizontalListViewChild(
                                duration: state.exercises[index].duration,
                                difficulty: state.exercises[index].difficulty,
                                exerciseName:
                                    state.exercises[index].exerciseName,
                                exercise: state.exercises[index],
                              );
                            }),
                          ),
                        ),
                        SeeAllWorkouts(
                          text: "Workout Levels",
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
                              return WorkoutLevelsListViewBuilder(
                                duration: state.exercises[index].duration,
                                difficulty: state.exercises[index].difficulty,
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
                            return VerticalListViewBuilderChild(
                                exerciseName:
                                    state.exercises[index].exerciseName,
                                duration: state.exercises[index].duration,
                                difficulty: state.exercises[index].difficulty,
                                data: state.exercises[index]);
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
