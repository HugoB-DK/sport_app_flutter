import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sport_app/blocs/exercise_cubit.dart';
import 'package:sport_app/blocs/my_exercise_cubit.dart';
import 'package:sport_app/repository/exercise_repository.dart';
import 'package:sport_app/repository/preferences_repository.dart';
import 'package:sport_app/repository/repository.dart';
import 'package:sport_app/ui/screens/details_exercise.dart';
import 'package:sport_app/ui/screens/home.dart';
import 'package:sport_app/ui/screens/search_exercise.dart';

void main() async{
  
  final PreferencesRepository preferencesRepository = PreferencesRepository();
  final ExerciseRepository exerciseRepository = ExerciseRepository();
  final Repository repository = Repository(exerciseRepository, preferencesRepository);
  
  final ExerciseCubit exerciseCubit = ExerciseCubit(repository);
  final MyExerciseCubit myExerciseCubit = MyExerciseCubit(repository);
  await myExerciseCubit.loadExo();

  runApp(
    MultiProvider(
    providers: [
      Provider<ExerciseCubit>(create: (_) => exerciseCubit,),
      Provider<MyExerciseCubit>(create: (_) => myExerciseCubit,),
    ],
    child: const MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/home': (context) => Home(),
        '/search': (context) => SearchExercise(),
        '/viewExercise': (context) => DetailsExercise(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}
