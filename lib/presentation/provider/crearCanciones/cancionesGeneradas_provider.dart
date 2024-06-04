import 'package:cuteapp/domain/entities/crearmusica/customMusic_entities.dart';
import 'package:cuteapp/infraestructure/datasources/crearCanciones/crearCancion_datasource_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'cancionesGeneradas_provider.g.dart';

@Riverpod(keepAlive: true)
class CancionesGeneradas extends _$CancionesGeneradas {
  @override
  List<CustomMusicEntities> build() {

    final List<CustomMusicEntities> listaRecetasCreadas=[];
    return listaRecetasCreadas;
  }
    void addRecetas( CustomMusicEntities music) {
    List<CustomMusicEntities> musicList=[
    ];
      musicList.add(music);
    state =[...state,...musicList];
  }
   void actualizarData() {
    state=[];
  }

  Future<String> createCanciones(String descripcion)async {
    final List<String> error=[];
    if(descripcion.isEmpty) return "";
    final cancionMe=  CustomMusicEntities(id: "0", titulo: descripcion, userId: "0", letra: "0", isDon: false, fromWho: "me");
    state=[...state,cancionMe];
    await responseApiCanciones(descripcion);
    return "Success";

  }
   Future<void> responseApiCanciones(String descripcionMusica) async{
    final createMusicaDatasource=CrearCancionDatasourceImple();
    final respose=await createMusicaDatasource.createMusic(descripcionMusica); 
    // final imageResponseApi= CustomCrearImagenEntities(id: "dfdf", pathImageUrl: respose, userId: "hfsdn", descripcion: descripcionImage, isDon: false,fromWho: "resposeApi");
    final musicResponseApi= CustomMusicEntities(id: "0", titulo: descripcionMusica, userId: "", letra: respose, isDon: false, fromWho: "resposeApi");
    state= [...state,musicResponseApi];
  }
}