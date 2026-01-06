import 'package:bond/core/global_models/generic_model.dart';
import 'package:bond/features/app/data/models/branches_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/services/api/api_handler_mixin.dart';
import '../../../../core/services/network/error/failures.dart';
import '../datasources/app_data_source.dart';

@LazySingleton()
class AppRepositoryImpl with ApiHandlerMixin {
  final AppDataSource appDataSource;

  AppRepositoryImpl({required this.appDataSource});

  Future<Either<Failure, List<GenericModel>>> getGovernorates() async {
    final response = await handleApi(() => appDataSource.getGovernorates());
    return response;
  }

  Future<Either<Failure, List<GenericModel>>> getRegion({int? id}) async {
    final response = await handleApi(
      () => appDataSource.getRegion(governorate: id),
    );
    return response;
  }

  Future<Either<Failure, List<BranchesModel>>> getBranches() async {
    final response = await handleApi(() => appDataSource.getBranches());
    return response;
  }
}
