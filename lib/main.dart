import 'package:especificacao_frontend/src/core/usecases/get_movie_list.dart';
import 'package:especificacao_frontend/src/data/repositories_impl/movie_repository_impl.dart';
import 'package:especificacao_frontend/src/presentation/screens/movie_list_screen.dart';
import 'package:flutter/material.dart';

void main() {
  final movieRepository = MovieRepositoryImpl();
  final getMovieList = GetMovieList(movieRepository);

  runApp(MyApp(getMovieList: getMovieList));
}

class MyApp extends StatelessWidget {
  final GetMovieList getMovieList;

  const MyApp({super.key, required this.getMovieList});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Golden Raspberry Awards',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MovieListScreen(getMovieList: getMovieList),
    );
  }
}
