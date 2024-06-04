

import 'package:cuteapp/domain/datasource/movies_datasource.dart';
import 'package:cuteapp/domain/entities/movie.dart';
import 'package:cuteapp/domain/repositories/movies_repositories.dart';

class MovieRepositoryImpl extends MovieRepository{


  final MoviesDataSource datasource;

  MovieRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getNowMovies({int page = 1}) {
    return datasource.getNowMovies(page: page);

  }
  


}