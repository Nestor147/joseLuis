import 'package:cuteapp/domain/entities/crearImagenes/crearImagen_entities.dart';
import 'package:cuteapp/domain/entities/crearmusica/customMusic_entities.dart';

abstract class CrearMusicasDatasource{
    Future<String> createMusic(String descripcion);
   Future<bool> isdone(String uuid,bool isDone );
   Future<bool> AddMusic(String letra, String fromWho, String titulo, String userId );
  Future<bool> deleteMusic(String uuid);
}