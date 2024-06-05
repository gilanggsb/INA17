import 'package:ina17/features/home/data/data.dart';
import 'package:ina17/features/home/domain/domain.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeLocalDataSource localDataSource;
  final HomeRemoteDataSource remoteDataSource;
  HomeRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });
}
