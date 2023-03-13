import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_clean_architecture/core/base_use_case/base_use_case.dart';
import 'package:movies_clean_architecture/core/error/failur.dart';
import 'package:movies_clean_architecture/movies/domain/entities/recommendation_entites.dart';
import 'package:movies_clean_architecture/movies/domain/repository/movies_repository_domain.dart';

class GetRecommendationUseCase extends BaseUseCase<List<RecommendationEntities> , RecommendationParams>{
  final MoviesRepositoryDomain repositoryDomain;

  GetRecommendationUseCase(this.repositoryDomain);
  @override
  Future<Either<Failure, List<RecommendationEntities>>> call(RecommendationParams param)async {
   return await repositoryDomain.getRecommendation(param);
  }

}

class RecommendationParams extends Equatable{
  final int id;

  const RecommendationParams(this.id);

  @override
  List<Object?> get props => [id];

}