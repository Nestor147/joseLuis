// To parse this JSON data, do
//
//     final recetasResponse = recetasResponseFromJson(jsonString);


import 'package:cuteapp/infraestructure/mappers/recetas/models/recetasApi_mapper.dart';

class RecetasResponse {
    final Recetas recetas;

    RecetasResponse({
        required this.recetas,
    });

    factory RecetasResponse.fromJson(Map<String, dynamic> json) => RecetasResponse(
        recetas: Recetas.fromJson(json["recetas"]),
    );

    Map<String, dynamic> toJson() => {
        "recetas": recetas.toJson(),
    };
}

class Recetas {
    final RecetasApi recetaNormal;
    final RecetasApi recetaSaludable;
    final RecetasApi recetaConCaloras;

    Recetas({
        required this.recetaNormal,
        required this.recetaSaludable,
        required this.recetaConCaloras,
    });

    factory Recetas.fromJson(Map<String, dynamic> json) => Recetas(
        recetaNormal: RecetasApi.fromJson(json["receta-normal"]),
        recetaSaludable: RecetasApi.fromJson(json["receta-saludable"]),
        recetaConCaloras: RecetasApi.fromJson(json["receta-con calorías"]),
    );

    Map<String, dynamic> toJson() => {
        "receta-normal": recetaNormal.toJson(),
        "receta-saludable": recetaSaludable.toJson(),
        "receta-con calorías": recetaConCaloras.toJson(),
    };
}

