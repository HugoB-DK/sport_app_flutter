import 'dart:convert';

import 'package:http/http.dart';

import '../models/exercise.dart';

class ExerciseRepository{

  Future<Map<String, dynamic>> fetchExercise() async{
    final Response response = await get(Uri.parse('https://wger.de/api/v2/exerciseinfo/?limit=419'), );
    if (response.statusCode == 200) {
      return jsonDecode(response.body); 
    } else {
      throw Exception('Failed to load Exercises');
    }
  }

  Future<dynamic> fetchExerciseById(String id) async{

    final Response response = await get(Uri.parse('https://wger.de/api/v2/exerciseinfo/${id}'),);
    if(response.statusCode == 200){
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load Exercise by ID');
    }
  }


}