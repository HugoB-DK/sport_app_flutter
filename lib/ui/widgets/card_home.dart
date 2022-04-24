import 'package:flutter/material.dart';

class CardHome extends StatelessWidget {
  const CardHome({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/collection');
      },
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
                  Title(color: Colors.white, child: Text('JAB AND STRAIGHT', style: TextStyle(fontSize: 20, color: Colors.white),)),
                  Text('5 exercices', style: TextStyle(color: Colors.grey[350]),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}