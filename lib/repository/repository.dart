import 'dart:convert';

import 'package:http/http.dart';
import 'package:sport_app/models/exercise.dart';
import 'package:sport_app/repository/exercise_repository.dart';
import 'package:sport_app/repository/preferences_repository.dart';

class Repository {
  ExerciseRepository exerciseRepository = ExerciseRepository();
  PreferencesRepository preferencesRepository = PreferencesRepository();


  Repository(this.exerciseRepository,this.preferencesRepository);


  Future<List<Exercise>> allExercises() async{
    final Map<String,dynamic> response = await exerciseRepository.fetchExercise();
    final List<Exercise> liste = [];
    if(response.containsKey("results")){
      final List<dynamic> results = response["results"];
      for (var item in results) {
        liste.add(Exercise.fromExoJson(item));
      }
    }
    return liste;
  }

  Future<Exercise> exerciseById() async{
    final dynamic response = await exerciseRepository.fetchExerciseById("0001");
    final Exercise exo;
    exo = Exercise.fromExoJson(response);

    return exo;
  }

  Future<void> saveExercise(Exercise exo) async { 
    preferencesRepository.saveExo(exo);
  }

  Future<List<Exercise>> loadExo() async =>preferencesRepository.loadExos();
}