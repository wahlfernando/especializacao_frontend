import 'package:http/http.dart' as http;

abstract class MovieRepository {
  Future<http.Response> getMovieList();
}
