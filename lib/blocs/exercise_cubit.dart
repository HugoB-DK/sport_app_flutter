import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_app/models/exercise.dart';
import 'package:sport_app/repository/repository.dart';

class ExerciseCubit extends Cubit<List<Exercise>>{
  final Repository _repository;
  List<Exercise> allExercise = [];

  ExerciseCubit(this._repository) : super([]){
    _repository.allExercises().then((value){
      allExercise = value;
    });
  }

  void searchByName(String value){
    if(value.isEmpty){
      emit(allExercise);
    } else{
      emit(allExercise.where((element) => element.name!.toLowerCase().contains(value.toLowerCase())).toList());
    }
  }

  void searchByCategory(String value){
    if(value.isEmpty || value == ""){
      emit(allExercise);
    } else{
      emit(allExercise.where((element) => element.muscle!.toLowerCase().contains(value.toLowerCase())).toList());
    }
  }

  // void saveExo(Exercise exo){
  //   emit([...state, exo]);
  //   print("state : " );
  //   print(exo);
  //   print("FIN STATE");
  //   _repository.saveExercise(exo);  
  // }

  // Future<void> loadExo() async {
  //   final List<Exercise> exos = await _repository.loadExo();
  //   print("------------------");
  //   print(exos);
  //   print("------------------");
  //   emit(exos);  
  // }

}