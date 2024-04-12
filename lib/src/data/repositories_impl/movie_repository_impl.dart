import 'dart:convert';
import 'package:especificacao_frontend/src/domain/repositories/movie_repository.dart';
import 'package:http/http.dart' as http;

import '../../domain/entities/movies.dart';

class MovieRepositoryImpl implements MovieRepository {
  
  MovieRepositoryImpl();

  @override
  Future<List<Movie>> getMovieList() async {
    try {
      var response = await http.get(Uri.parse('https://tools.texoit.com/backend-java/api/movies'));
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        List<Movie> movies = data.map((json) => Movie.fromJson(json)).toList();
        return movies;
      } else {
        throw Exception('Falha ao carregar filmes');
      }
    } catch (e) {
      throw Exception('Falha ao carregar filmes: $e');
    }
  }
}
