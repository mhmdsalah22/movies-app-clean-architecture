import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_clean_architecture/core/utils/enum.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/get_recommendation_usecase.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/movies_detail_usecase.dart';
import 'movies_detail_event.dart';
import 'movies_detail_state.dart';

class MoviesDetailBloc extends Bloc<MoviesDetailEvent, MoviesDetailState> {
  MoviesDetailBloc(this.moviesDetailUseCase, this.recommendationUseCase)
      : super(const MoviesDetailState()) {
    on<GetMovieDetailsEvent>(_getMoviesDetail);
    on<GetMovieRecommendationEvent>(_getRecommendationEvent);
  }

  final GetMoviesDetailUseCase moviesDetailUseCase;
  final GetRecommendationUseCase recommendationUseCase;

  FutureOr<void> _getMoviesDetail(
      GetMovieDetailsEvent event, Emitter<MoviesDetailState> emit) async {
    final result = await moviesDetailUseCase(MoviesDetailParams(id: event.id));
    result.fold(
      (l) => emit(state.copyWith(
        movieDetailsState: RequestState.error,
        movieDetailsMessage: l.message,
      )),
      (r) => emit(
        state.copyWith(
          movieDetailsState: RequestState.loaded,
          movieDetail: r,
        ),
      ),
    );
  }

  FutureOr<void> _getRecommendationEvent(GetMovieRecommendationEvent event,
      Emitter<MoviesDetailState> emit) async {
    final result = await recommendationUseCase(RecommendationParams(event.id),);
    result.fold(
      (l) => emit(state.copyWith(
        recommendationState: RequestState.error,
        recommendationMessage: l.message,
      )),
      (r) => emit(
        state.copyWith(
          recommendationState: RequestState.loaded,
          recommendation: r,
        ),
      ),
    );
  }
}
