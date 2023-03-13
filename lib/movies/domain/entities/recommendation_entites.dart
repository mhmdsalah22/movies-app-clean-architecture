import 'package:equatable/equatable.dart';

class RecommendationEntities extends Equatable {
  final String? backdropPath;
  final int id;

  const RecommendationEntities({this.backdropPath, required this.id});

  @override
  List<Object?> get props => [backdropPath, id];
}