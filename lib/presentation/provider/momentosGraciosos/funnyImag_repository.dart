import 'package:cuteapp/infraestructure/datasources/momentosGraciosos/funnyMoment_datasource.dart';
import 'package:cuteapp/infraestructure/datasources/moviedb_datasource.dart';
import 'package:cuteapp/infraestructure/repositories/momentosGraciosos/funnyImage_repository_impl.dart';
import 'package:cuteapp/infraestructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final funnyImageRepositoriesProvider=Provider((ref) => 
  FunnyImageRepositoryImpl(FunnyMomentDataSourceImpl())
);