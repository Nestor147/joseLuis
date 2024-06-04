
import 'package:cuteapp/domain/entities/CrearRecetas/customRecetas_entities.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'crearRecetas_provider.g.dart';

@riverpod
class CrearRecetas extends _$CrearRecetas {
  @override
  List<CustomRecetaEntities> build() {
    List<CustomRecetaEntities> listasRecetas=[];

    return listasRecetas;
  }

  void addReceta( CustomRecetaEntities receta) {
    List<CustomRecetaEntities> recetaList=[
    ];
      recetaList.add(receta);
    state =[...state,...recetaList];
  }

  void actualizarData() {
    state=[];
  }
}