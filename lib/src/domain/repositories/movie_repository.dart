import '../entities/movies.dart';

abstract class MovieRepository {
  Future<List<Movie>> getMovieList();
}
