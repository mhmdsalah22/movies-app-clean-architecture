import 'package:dartz/dartz.dart';
import 'package:movies_clean_architecture/core/error/exceptions.dart';
import 'package:movies_clean_architecture/core/error/failur.dart';
import 'package:movies_clean_architecture/movies/data/datasource/movies_remote_data_source.dart';
import 'package:movies_clean_architecture/movies/domain/entities/movies_detail.dart';
import 'package:movies_clean_architecture/movies/domain/entities/movies_entities.dart';
import 'package:movies_clean_architecture/movies/domain/entities/recommendation_entites.dart';
import 'package:movies_clean_architecture/movies/domain/repository/movies_repository_domain.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/get_recommendation_usecase.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/movies_detail_usecase.dart';

class MoviesRepositoryData implements MoviesRepositoryDomain {
  final BaseMoviesRemoteDataSource baseMoviesRemoteDataSource;

  MoviesRepositoryData({required this.baseMoviesRemoteDataSource});

  @override
  Future<Either<Failure, List<MoviesEntities>>> getNowPlayingMovies() async {
    final result = await baseMoviesRemoteDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MoviesEntities>>> getPopularMovies() async {
    final result = await baseMoviesRemoteDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MoviesEntities>>> getTopRatedMovies() async {
    final result = await baseMoviesRemoteDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MoviesDetailEntities>> getMoviesDetail(
      MoviesDetailParams params) async {
    final result = await baseMoviesRemoteDataSource
        .getMoviesDetail(MoviesDetailParams(id: params.id));
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<RecommendationEntities>>> getRecommendation(
      RecommendationParams params)async {
    final result = await baseMoviesRemoteDataSource
        .getRecommendation(params);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
