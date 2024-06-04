
class RecetasApi {
    final String nombreDeLaReceta;
    final List<String> ingredientes;
    final List<String> instrucciones;

    RecetasApi({
        required this.nombreDeLaReceta,
        required this.ingredientes,
        required this.instrucciones,
    });

    factory RecetasApi.fromJson(Map<String, dynamic> json) => RecetasApi(
        nombreDeLaReceta: json["Nombre de la receta"],
        ingredientes: List<String>.from(json["Ingredientes"].map((x) => x)),
        instrucciones: List<String>.from(json["Instrucciones"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "Nombre de la receta": nombreDeLaReceta,
        "Ingredientes": List<dynamic>.from(ingredientes.map((x) => x)),
        "Instrucciones": List<dynamic>.from(instrucciones.map((x) => x)),
    };
}
