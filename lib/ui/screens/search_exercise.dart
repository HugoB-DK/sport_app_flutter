import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'package:sport_app/blocs/exercise_cubit.dart';
import 'package:sport_app/repository/preferences_repository.dart';
import 'package:sport_app/ui/widgets/searchbar.dart';

import '../../models/exercise.dart';
import '../../repository/exercise_repository.dart';
import '../../repository/repository.dart';

class SearchExercise extends StatefulWidget {
  const SearchExercise({ Key? key }) : super(key: key);

  @override
  State<SearchExercise> createState() => _SearchExerciseState();
  

  
}

class _SearchExerciseState extends State<SearchExercise> {
  
    final Repository _repository = Repository(ExerciseRepository(),PreferencesRepository());
    List<Exercise> liste = [];
    String categoryFilter = "";
    
  @override
  Widget build(BuildContext context) {
    _repository.allExercises().then((value) {
      Provider.of<ExerciseCubit>(context,listen: false).allExercise = value;
      Provider.of<ExerciseCubit>(context,listen: false).searchByName("");
    setState(() {    
      liste = value;
    });});
    return 
    LoaderOverlay(
      child: Scaffold(
      backgroundColor: Color(0xFF0e1217),
      body: Column(
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
        Title(color: Colors.white, child: Text("Search Exercise", style: TextStyle(color: Colors.white, fontSize: 30),)),
        SearchBar(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Filter by Category", style: TextStyle(color: Colors.white)),
              DropdownButton(
          dropdownColor: Color(0xFF0e1217),
          value: categoryFilter,
          items: <String>['','Abs', 'Arms', 'Back', 'Calves', 'Chest', 'Legs', 'Shoulders'].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value, style: TextStyle(color: Colors.white),)
              );
          }).toList(), 
          onChanged: (String? newValue){
            Provider.of<ExerciseCubit>(context,listen: false).searchByCategory(newValue!);
            setState(() {
              categoryFilter = newValue;
            });
          }),
          ],
        ),
        

        Expanded(
        child: BlocBuilder<ExerciseCubit, List<Exercise>>(
          builder: (context, exos){
            return ListView.separated(
          itemBuilder: (BuildContext context, int index){
            final Exercise exo = exos[index];
            return ListTile(
              title: Text('${exo.name}', style: TextStyle(color: Colors.white),),
              onTap: () {
                Navigator.pushNamed(context, '/viewExercise', arguments: exo);
              }
            );
          }, 
          separatorBuilder: (context, index) => const Divider(
            height: 0,
          ),
          itemCount: exos.length);
          }
        )
        
      )
      ])
    )
    );
    
    
    
    
  }
}