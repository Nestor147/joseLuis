import 'package:cuteapp/domain/entities/AnecdotasGraciosas/anecdotasGraciosas_entities.dart';
import 'package:cuteapp/domain/entities/Busquedas/busquedas_entities.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'busquedas_provider.g.dart';


@riverpod
class Busquedas extends _$Busquedas {
  @override
   List<BusquedaEntities> build() {
    final List<BusquedaEntities> listaBusquedas=[];
    return listaBusquedas ;
  }


  void addBusqueda(BusquedaEntities busqueda) {
    List<BusquedaEntities> busquedasList=[];
      busquedasList.add(busqueda);
    state =[...state,...busquedasList];
  }

  void actualizarData() {
    state=[];
  }


}