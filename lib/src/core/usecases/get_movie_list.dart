// ignore_for_file: override_on_non_overriding_member

import 'package:especificacao_frontend/src/domain/repositories/movie_repository.dart';
import '../../domain/entities/movies.dart';
import '../utils/noparams.dart';

class GetMovieList {
  final MovieRepository repository;

  GetMovieList(this.repository);

  @override
  Future<List<Movie>> call(NoParams params) async {
    return await repository.getMovieList();
  }
}
