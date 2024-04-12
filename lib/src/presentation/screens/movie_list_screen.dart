// ignore_for_file: library_private_types_in_public_api

import 'package:especificacao_frontend/src/core/usecases/get_movie_list.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/movies.dart';
import '../../core/utils/noparams.dart';

class MovieListScreen extends StatefulWidget {
  final GetMovieList getMovieList;

  const MovieListScreen({super.key, required this.getMovieList});

  @override
  _MovieListScreenState createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  late Future<List<Movie>> _moviesFuture;

  @override
  void initState() {
    super.initState();
    _moviesFuture = widget.getMovieList(NoParams());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Lista de Filmes',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blueGrey[800],
      ),
      body: Container(
        color: Colors.grey[200],
        child: FutureBuilder<List<Movie>>(
          future: _moviesFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.blueGrey[800],
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Erro: ${snapshot.error}',
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            } else if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 3,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      child: ListTile(
                        title: Text(
                          snapshot.data![index].title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'Ano: ${snapshot.data![index].year.toString()}',
                          style: const TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    );
                  },
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    'Não há dados disponíveis',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
