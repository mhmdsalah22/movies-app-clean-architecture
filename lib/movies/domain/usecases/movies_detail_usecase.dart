import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_clean_architecture/core/base_use_case/base_use_case.dart';
import 'package:movies_clean_architecture/core/error/failur.dart';
import 'package:movies_clean_architecture/movies/domain/entities/movies_detail.dart';
import 'package:movies_clean_architecture/movies/domain/repository/movies_repository_domain.dart';

class GetMoviesDetailUseCase
    implements BaseUseCase<MoviesDetailEntities, MoviesDetailParams> {
  final MoviesRepositoryDomain moviesRepositoryDomain;

  GetMoviesDetailUseCase({required this.moviesRepositoryDomain});

  @override
  Future<Either<Failure, MoviesDetailEntities>> call(MoviesDetailParams params) async {
    return await moviesRepositoryDomain.getMoviesDetail(params);
  }
}

class MoviesDetailParams extends Equatable {
  final int id;

  const MoviesDetailParams({required this.id});

  @override

  List<Object?> get props => [id];



}
