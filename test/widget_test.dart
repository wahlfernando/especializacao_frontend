import 'package:especificacao_frontend/src/core/usecases/get_movie_list.dart';
import 'package:especificacao_frontend/src/core/utils/noparams.dart';
import 'package:especificacao_frontend/src/domain/entities/movies.dart';
import 'package:especificacao_frontend/src/presentation/screens/movie_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';


class MockGetMovieList extends Mock implements GetMovieList {}

void main() {
  late MockGetMovieList mockGetMovieList;

  setUp(() {
    mockGetMovieList = MockGetMovieList();
  });

  group('MovieListScreen Tests', () {
    testWidgets('Should show loading indicator while fetching movies',
        (WidgetTester tester) async {
      when(mockGetMovieList(NoParams())).thenAnswer((_) async => []);

      await tester.pumpWidget(
        MaterialApp(
          home: MovieListScreen(getMovieList: mockGetMovieList),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('Should show error message if fetching movies fails',
        (WidgetTester tester) async {
      when(mockGetMovieList(NoParams())).thenThrow(Exception('Failed to load movies'));

      await tester.pumpWidget(
        MaterialApp(
          home: MovieListScreen(getMovieList: mockGetMovieList),
        ),
      );

      expect(find.text('Erro: Failed to load movies'), findsOneWidget);
    });

    testWidgets('Should show movie list when movies are loaded',
        (WidgetTester tester) async {
      when(mockGetMovieList(NoParams())).thenAnswer((_) async => [
            Movie(id: 1, title: 'Movie 1', year: 2020, studios: [], producers: [], winner: false),
            Movie(id: 2, title: 'Movie 2', year: 2021, studios: [], producers: [], winner: false),
          ]);

      await tester.pumpWidget(
        MaterialApp(
          home: MovieListScreen(getMovieList: mockGetMovieList),
        ),
      );

      expect(find.text('Movie 1'), findsOneWidget);
      expect(find.text('Movie 2'), findsOneWidget);
    });

    testWidgets('Should show error message if no movies are available',
        (WidgetTester tester) async {
      when(mockGetMovieList(NoParams())).thenAnswer((_) async => []);

      await tester.pumpWidget(
        MaterialApp(
          home: MovieListScreen(getMovieList: mockGetMovieList),
        ),
      );

      expect(find.text('Não há dados disponíveis'), findsOneWidget);
    });
  });
}