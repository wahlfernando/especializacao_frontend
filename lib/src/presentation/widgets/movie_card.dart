import 'package:flutter/material.dart';
import '../../domain/entities/movies.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(movie.title),
      subtitle: Text('Ano: ${movie.year.toString()}'),
      trailing: movie.winner ? const Icon(Icons.star) : null,
    );
  }
}
