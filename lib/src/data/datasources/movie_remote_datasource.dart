import 'package:http/http.dart' as http;

class MovieRemoteDataSource {
  static const baseUrl = 'https://tools.texoit.com/backend-java/api/movies';

  Future<http.Response> fetchMovies() async {
    final response = await http.get(Uri.parse(baseUrl));
    return response;
  }
}
