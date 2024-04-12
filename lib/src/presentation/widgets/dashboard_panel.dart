import 'package:especificacao_frontend/src/presentation/widgets/movie_card.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/movies.dart';

class DashboardPanel extends StatelessWidget {
  final String title;
  final List<Movie> movies;

  const DashboardPanel({super.key, required this.title, required this.movies});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(title),
      children: _buildPanel(),
    );
  }

  List<Widget> _buildPanel() {
    if (movies.isEmpty) {
      return [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Não há dados disponíveis.',
            style: TextStyle(fontSize: 16.0),
          ),
        ),
      ];
    } else {
      // Se houver filmes na lista, criar um cartão para cada filme
      return movies.map((movie) => MovieCard(movie: movie)).toList();
    }
  }
}
