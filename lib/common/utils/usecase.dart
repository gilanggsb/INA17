import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:ina17/common/common.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
