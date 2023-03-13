import 'package:equatable/equatable.dart';
import 'package:movies_clean_architecture/movies/domain/entities/recommendation_entites.dart';
import '../../../core/utils/enum.dart';
import '../../domain/entities/movies_detail.dart';

class MoviesDetailState extends Equatable {
  const MoviesDetailState({
    this.movieDetail,
    this.movieDetailsState = RequestState.loading,
    this.movieDetailsMessage = '',
    this.recommendation = const [],
    this.recommendationState = RequestState.loading,
    this.recommendationMessage = '',
  });

  final MoviesDetailEntities? movieDetail;
  final RequestState movieDetailsState;
  final String movieDetailsMessage;

  final List<RecommendationEntities> recommendation;
  final RequestState recommendationState;
  final String recommendationMessage;

  MoviesDetailState copyWith({
    MoviesDetailEntities? movieDetail,
    RequestState? movieDetailsState,
    String? movieDetailsMessage,
    List<RecommendationEntities>? recommendation,
    RequestState? recommendationState,
    String? recommendationMessage,
  }) {
    return MoviesDetailState(
      movieDetail: movieDetail ?? this.movieDetail,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      recommendation: recommendation ?? this.recommendation,
      recommendationState: recommendationState ?? this.recommendationState,
      recommendationMessage:
      recommendationMessage ?? this.recommendationMessage,
    );
  }

  @override
  List<Object?> get props => [
        movieDetail,
        movieDetailsState,
        movieDetailsMessage,
        recommendation,
        recommendationState,
        recommendationMessage,
      ];
}
