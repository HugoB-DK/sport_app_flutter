import 'dart:convert';

class Exercise {
  int? id;
  String? name;
  String? muscle;
  String? equipement;
  List<String>? images;

  Exercise(this.id, this.name, this.muscle,this.equipement, this.images);

  factory Exercise.fromExoJson(Map<String, dynamic> json){
    final int id = json["id"];
    final String name = json["name"];
    final String muscle = json["category"]["name"] ?? "";
    String equipement = "";
    if(json.containsKey("equipement")){
      equipement = json["equipement"]["name"];
    } else{
      equipement = "Pas d'équipement";
    }
    List<String> liste = [];
    if(json.containsKey("images")){
      final List<dynamic> results = json["images"];
      for (var item in results) {
        liste.add(item['image']);
      }
    }
    final List<String> images = liste;

    return Exercise(id, name, muscle,equipement, images);
  }
  
    String toJson(){
    return jsonEncode({
      'id': id,
      'name': name,
      'muscle' : muscle,
      'equipement' : equipement,
      'images' : images
    });
  }

    factory Exercise.fromJson(String json){
    Map<String, dynamic> map = jsonDecode(json);
    return Exercise(
      map['id'],
      map['name'],
      map['muscle'],
      map['equipement'],
      map['images']
    );
  }
}