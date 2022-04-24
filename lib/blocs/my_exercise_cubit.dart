import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_app/models/exercise.dart';
import 'package:sport_app/repository/repository.dart';

class MyExerciseCubit extends Cubit<List<Exercise>>{
  final Repository _repository;
  List<Exercise> myExercise = [];

  MyExerciseCubit(this._repository) : super([]);

  void saveExo(Exercise exo){
    emit([...state, exo]);
    print("state : " );
    print(exo);
    print("FIN STATE");
    _repository.saveExercise(exo);  
  }

  Future<void> loadExo() async {
    final List<Exercise> exos = await _repository.loadExo();
    print("------------------");
    print(exos);
    print("------------------");
    emit(exos);  
  }

}