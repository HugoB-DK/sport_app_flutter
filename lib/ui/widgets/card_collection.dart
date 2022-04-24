import 'package:flutter/material.dart';

class CardCollection extends StatelessWidget {
  const CardCollection({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset("assets/workout.jpg", height: 100, width: 100, fit: BoxFit.cover,),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Title(color: Colors.white, child: Text("Traditionnal Jab", style: TextStyle(fontSize: 20),)),
              Text("00:30", style: TextStyle(fontSize: 14),),
            ],
          )
        ],
      ),
    );
  }
}