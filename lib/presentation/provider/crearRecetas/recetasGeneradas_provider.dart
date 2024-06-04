
import 'package:cuteapp/domain/entities/CrearRecetas/customRecetas_entities.dart';
import 'package:cuteapp/infraestructure/datasources/crearRecetas/crearRecetas_datasource_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'recetasGeneradas_provider.g.dart';

@Riverpod(keepAlive: true)
class RecetasGeneradas extends _$RecetasGeneradas {
  @override
  List<CustomRecetaEntities> build() {

    final List<CustomRecetaEntities> listaRecetasCreadas=[];
    return listaRecetasCreadas;
  }
    void addRecetas( CustomRecetaEntities receta) {
    List<CustomRecetaEntities> recetasList=[
    ];
      recetasList.add(receta);
    state =[...state,...recetasList];
  }


  void actualizarData() {
    state=[];
  }

  Future<String> createReceta(String descripcion)async {
    if(descripcion.isEmpty) return "";
    final recetaMe=  CustomRecetaEntities(id: "0", userId: "0", tipo: "0", descripcion: "", isDon: false, fromWho: "me", ingredientes: descripcion);
    state=[...state,recetaMe];
    await responseApiReceta(descripcion);
    return "Success";

  }
   Future<void> responseApiReceta(String descripcion) async{
    final createRecetaDatasource=CrearRecetasDatasourceImple();
    final respose=await createRecetaDatasource.createReceta(descripcion);
    final recetaResponseApi= CustomRecetaEntities(id: "0", userId: "0", tipo: "0", descripcion: respose, isDon: false, fromWho: "resposeApi", ingredientes: descripcion);
    state= [...state,recetaResponseApi];
  }



}