
import 'package:cuteapp/domain/entities/crearImagenes/crearImagen_entities.dart';
import 'package:cuteapp/infraestructure/datasources/crearImagenes/crearImagenes_datasource_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'imagenesGeneradas_provider.g.dart';

@Riverpod(keepAlive: true)
class ImagenesGeneradas extends _$ImagenesGeneradas {
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

  Future<String> createImagenes(String descripcion)async {
    if(descripcion.isEmpty) return "";
    final imageMe=  CustomCrearImagenEntities(id: "0", pathImageUrl: "0", userId: "0", descripcion: descripcion, isDon: false,fromWho: "me");
    state=[...state,imageMe];
    await responseApiImage(descripcion);
    return "Success";

  }
   Future<void> responseApiImage(String descripcionImage) async{
    final createIamgeDatasource=CrearImageDatasourceImple();
    final respose=await createIamgeDatasource.createImage(descripcionImage);
    final imageResponseApi= CustomCrearImagenEntities(id: "dfdf", pathImageUrl: respose, userId: "hfsdn", descripcion: descripcionImage, isDon: false,fromWho: "resposeApi");
    state= [...state,imageResponseApi];
  }



}