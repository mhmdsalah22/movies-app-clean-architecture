import 'package:movies_clean_architecture/movies/domain/entities/movies_entities.dart';

class MoviesModel extends MoviesEntities {
  const MoviesModel({
    required super.releaseDate,
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.genreIds,
    required super.overview,
    required super.voteAverage,
  });

  factory MoviesModel.fromJson(Map<String, dynamic> json) {
    return MoviesModel(
        releaseDate: json['release_date'],
        id: json['id'],
        title: json['title'],
        backdropPath: json['backdrop_path'],
        genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
        overview: json['overview'],
        voteAverage: json['vote_average'].toDouble(),
    );
  }
}
