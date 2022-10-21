import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'dependency_injection.dart' as di;
import 'features/gofit/presentation/screens/homepage/bloc/exercise_bloc.dart';
import 'features/gofit/presentation/screens/homepage/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ExercisesBloc>(
          create: (context) => GetIt.instance<ExercisesBloc>(),
        )
      ],
      child: MaterialApp(
        title: 'GoFit',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: HomePage(),
      ),
    );
  }
}
