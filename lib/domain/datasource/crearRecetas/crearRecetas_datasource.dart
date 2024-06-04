

abstract class CrearRecetasDatasource{
 Future<String> createReceta(String descripcion);
   Future<bool> isdone(String uuid,bool isDone );
   Future<bool> AddReceta(String descripcion, String fromWho, String ingredientes, String userId );
  Future<bool> deleteReceta(String uuid);
}