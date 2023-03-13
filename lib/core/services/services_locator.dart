import 'package:get_it/get_it.dart';
import 'package:movies_clean_architecture/movies/data/datasource/movies_remote_data_source.dart';
import 'package:movies_clean_architecture/movies/data/repository/movies_repository_data.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/get_recommendation_usecase.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/movies_detail_usecase.dart';
import 'package:movies_clean_architecture/movies/presentation/movies_bloc/movies_bloc.dart';
import '../../movies/domain/repository/movies_repository_domain.dart';
import '../../movies/domain/usecases/get_now_playing_movies_usecase.dart';
import '../../movies/presentation/movies_bloc/movies_detail_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  init() {
    ///Movies Bloc
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MoviesDetailBloc(sl(), sl()));

    ///Data Source
    sl.registerLazySingleton<BaseMoviesRemoteDataSource>(
            () => MoviesRemoteDataSource());

    ///REPOSITORY
    sl.registerLazySingleton<MoviesRepositoryDomain>(
            () => MoviesRepositoryData(baseMoviesRemoteDataSource: sl()));

    ///USE CASES
    sl.registerLazySingleton(
            () => GetNowPlayingMoviesUseCase(moviesRepositoryDomain: sl()));

    sl.registerLazySingleton(
            () => GetPopularMoviesUseCase(moviesRepositoryDomain: sl()));

    sl.registerLazySingleton(
            () => GetTopRatedMoviesUseCase(moviesRepositoryDomain: sl()));
    sl.registerLazySingleton(
            () => GetMoviesDetailUseCase(moviesRepositoryDomain: sl()));
    sl.registerLazySingleton(
            () => GetRecommendationUseCase(sl()));
  }
}
