import 'package:especificacao_frontend/src/data/repositories_impl/movie_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late MockHttpClient mockHttpClient;
  late MovieRepositoryImpl movieRepository;
  late String baseUrl = 'https://tools.texoit.com/backend-java/api/movies';

  setUp(() {
    mockHttpClient = MockHttpClient();
    movieRepository = MovieRepositoryImpl();
  });

  group('MovieRepository Tests', () {
    test('Should return a list of movies when the API call is successful', () async {
      const sampleResponse = '''
      [
        {"id": 1, "title": "Movie 1", "year": 2020, "studios": [], "producers": [], "winner": false},
        {"id": 2, "title": "Movie 2", "year": 2021, "studios": [], "producers": [], "winner": false}
      ]
      ''';
      when(mockHttpClient.get(Uri.parse(baseUrl)))
          .thenAnswer((_) async => http.Response(sampleResponse, 200));

      final movies = await movieRepository.getMovieList();

      expect(movies.length, 2);
      expect(movies[0].title, 'Movie 1');
      expect(movies[1].title, 'Movie 2');
      // Adicione mais expectativas conforme necessário
    });

    test('Should throw an exception when the API call fails', () async {
      when(mockHttpClient.get(Uri.parse(baseUrl)))
          .thenAnswer((_) async => http.Response('Failed to load movies', 500));

      expect(() => movieRepository.getMovieList(), throwsException);
    });
  });
}
