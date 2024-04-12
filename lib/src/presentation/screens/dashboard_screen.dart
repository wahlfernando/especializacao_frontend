import 'package:flutter/material.dart';

import '../../domain/entities/movies.dart';
import '../widgets/dashboard_panel.dart';

class DashboardScreen extends StatelessWidget {
  final List<Movie> movies;

  const DashboardScreen({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: ListView(
        children: [
          DashboardPanel(
            title: 'Anos com mais de um vencedor',
            movies: movies,
          ),
          DashboardPanel(
            title: 'Estúdios com mais vitórias',
            movies: movies,
          ),
          DashboardPanel(
            title: 'Produtores com maior e menor intervalo entre vitórias',
            movies: movies,
          ),
          DashboardPanel(
            title: 'Vencedores de determinado ano',
            movies: movies,
          ),
        ],
      ),
    );
  }
}
