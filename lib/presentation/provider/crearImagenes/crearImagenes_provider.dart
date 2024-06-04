
import 'package:cuteapp/domain/entities/crearImagenes/crearImagen_entities.dart';
import 'package:cuteapp/infraestructure/datasources/crearImagenes/crearImagenes_datasource_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'crearImagenes_provider.g.dart';

@riverpod
class CrearImagenes extends _$CrearImagenes {
  @override
  List<CustomCrearImagenEntities> build() {

    final List<CustomCrearImagenEntities> listaImagnesCreadas=[];
    return listaImagnesCreadas;
  }
    void addImage( CustomCrearImagenEntities image) {
    List<CustomCrearImagenEntities> imageList=[
    ];
      imageList.add(image);
    state =[...state,...imageList];
  }


  void actualizarData() {
    state=[];
  }
}