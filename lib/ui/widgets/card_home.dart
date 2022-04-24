import 'package:flutter/material.dart';
import 'package:sport_app/models/exercise.dart';

class CardHome extends StatelessWidget {
  final Exercise exo;
  const CardHome(this.exo);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 250,
        margin: EdgeInsets.only(left: 15, right: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
    
          image: DecorationImage(
            image: AssetImage("assets/workout.jpg"), fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.45), BlendMode.dstATop)
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 5, right: 5),
                      padding: const EdgeInsets.symmetric( vertical: 6, horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey
                      ),
                      child: Text("Basic", style: TextStyle(color: Colors.white))
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric( vertical: 6, horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey
                      ),
                      child: Text("Boxing", style: TextStyle(color: Colors.white))
                    ),
                ],
              ),
            ),
            Container(
              child: 
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Title(color: Colors.white, child: Text(exo.name ?? "Pas de nom", style: TextStyle(fontSize: 20, color: Colors.white),)),
                  Text(exo.muscle ?? "Pas de catégorie", style: TextStyle(color: Colors.grey[350]),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}