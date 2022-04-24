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
      final Exercise exo = new Exercise(map['id'], map['name'], map['muscle'], map['equipement'], map['images']);
      exos.add(exo);
    }

    // Exercise un = new Exercise(0, "TEST", "TEST", "TEST", []);

    // exos.add(un);
    // exos.add(Exercise.fromExoJson(json.decode(prefs.getString(key)!)));
    // print(exos);
    // List<String>? myExos = prefs.getStringList("exos");
    // if(myExos != null){
    //   for (var item in myExos) {
    //     exos.add(Exercise.fromJson(item));
    //   }
    // } 
    return exos;

  }

}

