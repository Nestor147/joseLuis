import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cuteapp/domain/entities/AnecdotasGraciosas/anecdotasGraciosas_entities.dart';
import 'package:cuteapp/infraestructure/datasources/anecdotasGraciosas/anecdoteFunnyDatasource_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'anecdotasGraciosas_provider.g.dart';


@riverpod
class AnecdotasGraciosas extends _$AnecdotasGraciosas {
  @override
   List<CustomAnecdotaEntities> build() {
    final List<CustomAnecdotaEntities> listaAnecdotas=[];
    return listaAnecdotas ;
  }


  void addAnecdotaGraciosa(CustomAnecdotaEntities anecdota) {
    List<CustomAnecdotaEntities> anecdotesList=[];
      anecdotesList.add(anecdota);
    state =[...state,...anecdotesList];
  }

  void actualizarData() {
    state=[];
  }


}