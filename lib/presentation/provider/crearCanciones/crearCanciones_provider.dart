

import 'package:cuteapp/domain/entities/crearmusica/customMusic_entities.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'crearCanciones_provider.g.dart';

@riverpod
class CrearCanciones extends _$CrearCanciones {
  @override
   List<CustomMusicEntities> build() {
    List<CustomMusicEntities> listaCanciones=[];
    return listaCanciones ;
  }

   void addMusic( CustomMusicEntities musica) {
    List<CustomMusicEntities> musictesList=[];
      musictesList.add(musica);
    state =[...state,...musictesList];
  }

  void actualizarData() {
    state=[];
  }
}