import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sport_app/models/exercise.dart';

class PreferencesRepository{

  Future<void> saveExo(Exercise exo) async{
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("Exo${exo.id.toString()}", jsonEncode(exo));
  }

  Future<List<Exercise>> loadExos() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final keys  = prefs.getKeys();
    print(keys);
    for (var key in keys) {
      final json = prefs.getString(key.toString()) ?? '';
      Map<String, dynamic> map = jsonDecode(json);
      print(map);
    }

    List<Exercise> exos = [];
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

