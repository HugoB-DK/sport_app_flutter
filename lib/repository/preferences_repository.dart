import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sport_app/models/exercise.dart';

class PreferencesRepository{

  Future<void> saveExo(Exercise exo) async{
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("Exo${exo.id.toString()}", exo.toJson());
  }

  Future<List<Exercise>> loadExos() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final keys  = prefs.getKeys();
    List<Exercise> exos = [];
    print(keys);
    for (var key in keys) {
      final json = prefs.getString(key) ?? '';
      Map<String, dynamic> map = jsonDecode(json);
      final Exercise exo = new Exercise(map['id'], map['name'], map['muscle'], map['equipement'], []);
      exos.add(exo);
    }

    return exos;

  }

}

