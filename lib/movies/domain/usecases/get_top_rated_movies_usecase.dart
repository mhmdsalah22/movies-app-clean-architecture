import 'package:dartz/dartz.dart';
import 'package:movies_clean_architecture/movies/domain/entities/movies_entities.dart';
import 'package:movies_clean_architecture/movies/domain/repository/movies_repository_domain.dart';
import '../../../core/base_use_case/base_use_case.dart';
import '../../../core/error/failur.dart';

class GetTopRatedMoviesUseCase implements BaseUseCase<List<MoviesEntities> , NoParam>{
  final MoviesRepositoryDomain moviesRepositoryDomain;

  GetTopRatedMoviesUseCase({required this.moviesRepositoryDomain});

  @override
  Future<Either<Failure , List< MoviesEntities >>> call(NoParam noParam)async{
    return await moviesRepositoryDomain.getTopRatedMovies();
  }
}