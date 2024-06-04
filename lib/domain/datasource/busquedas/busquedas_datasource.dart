


abstract class BusquedasDatasource{

  Future<bool> AddBusqueda(String descripcion,String userId);

  Future<bool> isdone(String uuid,bool isDone );
  Future<bool> deleteBusqueda(String uuid);

}