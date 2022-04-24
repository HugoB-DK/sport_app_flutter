import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sport_app/blocs/exercise_cubit.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40, bottom: 40),
      //alignment: Alignment.center,
      child: SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
        child: TextField(
          onChanged: (String value) {
            Provider.of<ExerciseCubit>(context,listen: false).searchByName(value);
          },
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.grey)
            ),
            filled: true,
            fillColor: Colors.grey[600],
            prefixIcon: Icon(Icons.search, color: Colors.grey[350]),
            hintText: "Search",
            hintStyle: TextStyle(color: Colors.grey[350])
          ),
        ),
      ),
    );
  }
}