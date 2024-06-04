

import 'package:cuteapp/domain/entities/crearImagenes/crearImagen_entities.dart';

abstract class CrearImagenDatasource{
  Future<String> createImage(String descripcion);
   Future<bool> isdone(String uuid,bool isDone );
   Future<bool> AddImage(String descripcion, String fromWho, String pathImageUrl, String userId );
  Future<bool> deleteImage(String uuid);
}