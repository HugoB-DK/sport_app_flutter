import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sport_app/blocs/exercise_cubit.dart';
import 'package:sport_app/blocs/my_exercise_cubit.dart';
import 'package:sport_app/models/exercise.dart';
import 'package:sport_app/repository/preferences_repository.dart';
import 'package:sport_app/repository/repository.dart';

import '../../repository/exercise_repository.dart';



class DetailsExercise extends StatefulWidget {
  const DetailsExercise({ Key? key }) : super(key: key);

  @override
  State<DetailsExercise> createState() => _DetailsExerciseState();
}

class _DetailsExerciseState extends State<DetailsExercise> {
  
  final Repository _repository = Repository(ExerciseRepository(), PreferencesRepository());
  Exercise? _exercise;

  @override
  Widget build(BuildContext context) {

    final myExo = ModalRoute.of(context)!.settings.arguments as Exercise;

    return Container(
      color: Color(0xFF0e1217),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          Title(color: Colors.white, child: Text("${myExo.name ?? "My exercise"}", style: TextStyle(color: Colors.white),)),
          Image.network("https://medias.toutelanutrition.com/ressource/104/D%C3%A9clin%C3%A9%20halt%C3%A8res.jpg"),
          Container(
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: Color.fromRGBO(239, 236, 255, 0.5),
              borderRadius: BorderRadius.circular(20)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              verticalDirection: VerticalDirection.down,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text("Muscle : ${myExo.muscle ?? "No muscle"}", style: TextStyle(color: Colors.black, fontSize: 15)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text("Equipement : ${myExo.equipement ?? "No equipement"}", style: TextStyle(color: Colors.black, fontSize: 15)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [Color(0xFF9cba00),Color(0xFFd6ff00)],
                  end: Alignment(0.2, 0.0)
                ),
              ),
              child: ElevatedButton(
                onPressed: (){
                  context.read<MyExerciseCubit>().saveExo(myExo);
                  Navigator.of(context).pop(myExo);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  shadowColor: Colors.transparent
                ),  
                child: Row(
                  children: [
                    Text("Ajouter aux favoris", style: TextStyle(color: Color(0xFF0e1217)),),
                    Icon(Icons.favorite_border_outlined, color: Color(0xFF0e1217),)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}