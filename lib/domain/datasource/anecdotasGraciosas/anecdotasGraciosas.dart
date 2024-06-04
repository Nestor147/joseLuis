

import 'package:cuteapp/presentation/widgets/anecdotasGraciosas/shared/CustomAnecdote.dart';

abstract class AnedotasFunnyDatasource{

  Future<bool> AddAnecdote(String descripcion, String title, int image,String userId);
  // Stream<List<CustomAnecdotaEntities>> getAnecdote();
  // List<Anecdota> getAnecdotes
  Future<bool> isdone(String uuid,bool isDone );
  Future<bool> updateAnecdota(String uuid,int image, String title, String descripcion );
  Future<bool> deleteAnecdota(String uuid);

}