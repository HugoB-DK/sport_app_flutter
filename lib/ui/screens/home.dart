import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_app/blocs/exercise_cubit.dart';
import 'package:sport_app/blocs/my_exercise_cubit.dart';
import 'package:sport_app/models/exercise.dart';
import 'package:sport_app/ui/widgets/card_home.dart';
import 'package:sport_app/ui/widgets/searchbar.dart';

class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0e1217),
      appBar: AppBar(
        title: Text("Sport & Vous"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Title(color: Colors.white, child: Text("Discover", style: TextStyle(fontSize: 35, color: Colors.white, fontWeight: FontWeight.bold, ))),
                Title(color: Colors.white, child: Text("How to Shape", style: TextStyle(fontSize: 35, color: Colors.white, fontWeight: FontWeight.bold))),
                Title(color: Colors.white, child: Text("The Body", style: TextStyle(fontSize: 35, color: Colors.white, fontWeight: FontWeight.bold)))
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              height: 400,
              child: 
              BlocBuilder<MyExerciseCubit, List<Exercise>>(
                builder: (context, exos){
                  return exos.isEmpty
                  ? const Center(child: Text("Aucun favoris"),)
                  : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index){
                      final Exercise exo = exos[index];
                      return CardHome();
                    },
                    itemCount: exos.length,
                  );
                }
              ),
              
            ),
            Container(
                    width: 250,
                    margin: EdgeInsets.only(left: 15, right: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/search');
                          },
                          child: Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white,style: BorderStyle.solid, width: 3),
                              borderRadius: BorderRadius.circular(15)
                            ),
                            child: Icon(Icons.add, color: Colors.white),
                          ),
                        ),
                        Title(color: Colors.white, child: Text("Créer", style: TextStyle(color: Colors.white, fontSize: 25),))
                        
                      ],
                    ),
                  )
            
            
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Collections',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Exercises',
            icon: Icon(Icons.home),
          )
        ]
      ),
    );
  }
}

/**
 * 
 * SNACK BAR
 */