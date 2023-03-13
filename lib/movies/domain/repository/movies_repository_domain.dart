import 'package:dartz/dartz.dart';
import 'package:movies_clean_architecture/movies/domain/entities/movies_detail.dart';
import 'package:movies_clean_architecture/movies/domain/entities/movies_entities.dart';
import 'package:movies_clean_architecture/movies/domain/entities/recommendation_entites.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/get_recommendation_usecase.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/movies_detail_usecase.dart';
import '../../../core/error/failur.dart';

abstract class MoviesRepositoryDomain {
  Future<Either<Failure, List<MoviesEntities>>> getNowPlayingMovies();

  Future<Either<Failure, List<MoviesEntities>>> getPopularMovies();

  Future<Either<Failure, List<MoviesEntities>>> getTopRatedMovies();

  Future<Either<Failure, MoviesDetailEntities>> getMoviesDetail(
      MoviesDetailParams params);

  Future<Either<Failure, List<RecommendationEntities>>> getRecommendation(
      RecommendationParams params);
}
