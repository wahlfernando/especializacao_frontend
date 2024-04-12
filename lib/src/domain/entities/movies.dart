class Movie {
  final int id;
  final int year;
  final String title;
  final List<String> studios;
  final List<String> producers;
  final bool winner;

  Movie({
    required this.id,
    required this.year,
    required this.title,
    required this.studios,
    required this.producers,
    required this.winner,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      year: json['year'],
      title: json['title'],
      studios: List<String>.from(json['studios']),
      producers: List<String>.from(json['producers']),
      winner: json['winner'],
    );
  }
}
