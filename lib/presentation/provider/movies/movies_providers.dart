// import 'package:cuteapp/presentation/provider/movies/movie_repository.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../../domain/entities/movie.dart';

// final nowplayingMoviesProvider=StateNotifierProvider<MoviesNotifier,List<Movie>>((ref) {
//   final fetchMoreMovie=ref.watch(movieRepositoryProvider).getNowMovies;
//    return MoviesNotifier(fetchMoreMovie: fetchMoreMovie); });

// typedef MovieCallBack=Future<List<Movie>> Function({int page});

// class MoviesNotifier extends StateNotifier<List<Movie>>{
//     final MovieCallBack fetchMoreMovie;

//   MoviesNotifier({required this.fetchMoreMovie}):super([]);

//   int currentpage=0;
//   bool isloading=false;

//   Future<void> loadNextPage()async{
//     if(isloading) return;
//     isloading=true;
//     currentpage++;
//     final List<Movie> movies=await fetchMoreMovie(page: currentpage);
//     state=[...state, ...movies];
//     isloading=false;
//   }
// } 