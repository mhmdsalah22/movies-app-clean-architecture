import 'package:equatable/equatable.dart';

abstract class MoviesDetailEvent extends Equatable {
  const MoviesDetailEvent();
}

class GetMovieDetailsEvent extends MoviesDetailEvent {
  final int id;

  const GetMovieDetailsEvent(this.id);

  @override
  List<Object?> get props => [id];
}

class GetMovieRecommendationEvent extends MoviesDetailEvent {
  final int id;

  const GetMovieRecommendationEvent(this.id);

  @override
  List<Object> get props => [id];
}
