

import 'package:cuteapp/domain/entities/movie.dart';
import 'package:cuteapp/infraestructure/models/movieDb/movie_movie_db.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB movieDb) => Movie(
      adult: movieDb.adult,
      backdropPath: (movieDb.backdropPath != '')
          ? "https://image.tmdb.org/t/p/w500${movieDb.backdropPath}"
          : 'https://www.keysigns.co.uk/images/no-exit-signs-p1369-45422_image.jpg',
      genreIds: movieDb.genreIds.map((e) => e.toString()).toList(),
      id: movieDb.id,
      originalLanguage: movieDb.originalLanguage,
      originalTitle: movieDb.originalTitle,
      overview: movieDb.overview,
      popularity: movieDb.popularity,
      posterPath: (movieDb.posterPath != '')
          ? "https://image.tmdb.org/t/p/w500${movieDb.posterPath}"
          : 'no-poster',
      releaseDate: movieDb.releaseDate,
      title: movieDb.title,
      video: movieDb.video,
      voteAverage: movieDb.voteAverage,
      voteCount: movieDb.voteCount);
}

