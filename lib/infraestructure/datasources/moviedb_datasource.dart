

// import 'package:cuteapp/config/constants/environment.dart';
// import 'package:cuteapp/domain/datasource/movies_datasource.dart';
// import 'package:cuteapp/domain/entities/movie.dart';
// import 'package:cuteapp/infraestructure/mappers/movie_mapper.dart';
// import 'package:cuteapp/infraestructure/models/movieDb/moviedb_response.dart';
// import 'package:dio/dio.dart';

// class MoviedbDataSource extends MoviesDataSource{
//   final dio=Dio(
//     BaseOptions(
//       baseUrl: 'https://api.themoviedb.org/3',
//       queryParameters: {
//         'api_key': Enviroment.theMovieDbKey,
//         // 'api_key': "8488e61035cb8c5efe3efbfed8020b0c",
//         'language':'ES-MX'
//       }
//     )
//   );
//   List<Movie> _jsonToMovies(Map<String,dynamic> json){
//     final movieDbResponse=MovieDbResponse.fromJson(json);
//     final List<Movie> movies=movieDbResponse.results
//     .where((moviedb) => moviedb.posterPath!='no-poster')
//     .map((moviedb) => MovieMapper.movieDBToEntity( moviedb)).toList();
//     return movies;


//   }
//   @override
//   Future<List<Movie>> getNowMovies({int page = 1})async{

//     final response= await dio.get('/movie/now_playing',queryParameters: {'page':page});
//     return _jsonToMovies(response.data);
    
//   }
  
// //   @override
// //   Future<List<Movie>> getPopularNowMovies({int page = 1})async {
// //    final response= await dio.get('/movie/popular',queryParameters: {'page':page});
// //     return _jsonToMovies(response.data);
// //   }
  
// //   @override
// //   Future<List<Movie>> getTopRatedowMovies({int page = 1}) async{
// //    final response= await dio.get('/movie/top_rated',queryParameters: {'page':page});
// //     return _jsonToMovies(response.data);
// //   }
  
// //   @override
// //   Future<List<Movie>> getUpComingNowMovies({int page = 1}) async{
// //  final response= await dio.get('/movie/upcoming',queryParameters: {'page':page});
// //     return _jsonToMovies(response.data);
// //   }

// }