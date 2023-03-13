import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_clean_architecture/core/error/failur.dart';

abstract class BaseUseCase<t , Param>{
  Future<Either < Failure , t >> call(Param param);
}

class NoParam extends Equatable{
  const NoParam();

  @override
  List<Object?> get props => [];
}