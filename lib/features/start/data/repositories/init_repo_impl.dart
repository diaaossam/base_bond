import 'package:auto_route/auto_route.dart';
import 'package:bond/core/services/network/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/services/api/api_handler_mixin.dart';
import '../datasources/init_remote_data_source.dart';

@LazySingleton()
class InitRepo with ApiHandlerMixin {
  final InitRemoteDataSource initRemoteDataSource;

  InitRepo({required this.initRemoteDataSource});

  Future<Either<Failure, PageRouteInfo>> initApp() async {
    final response = await handleApi(() => initRemoteDataSource.initUser());
    return response;
  }
}
