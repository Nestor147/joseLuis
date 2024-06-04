
import 'package:cuteapp/domain/entities/movie.dart';

abstract class MovieRepository{

  Future<List<Movie>> getNowMovies({int page=1});
  //   Future<List<Movie>> getPopularNowMovies({int page=1});
  // Future<List<Movie>> getTopRatedowMovies({int page=1});
  // Future<List<Movie>> getUpComingNowMovies({int page=1});
}