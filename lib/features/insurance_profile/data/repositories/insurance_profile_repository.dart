import 'package:bond/core/services/api/api_handler_mixin.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/global_models/generic_model.dart';
import '../../../../core/services/network/error/failures.dart';
import '../datasources/insurance_profile_data_source.dart';
import '../models/insurance_profile_model.dart';

@LazySingleton()
class InsuranceProfileRepository with ApiHandlerMixin {
  final InsuranceProfileDataSource _dataSource;

  InsuranceProfileRepository(this._dataSource);

  Future<Either<Failure, List<GenericModel>>> getInsuranceCompanies() async {
    return handleApi(() => _dataSource.getInsuranceCompanies());
  }

  Future<Either<Failure, InsuranceProfileModel?>> getInsuranceProfile() async {
    return handleApi(() => _dataSource.getInsuranceProfile());
  }

  Future<Either<Failure, InsuranceProfileModel>> createInsuranceProfile(
    InsuranceProfileRequest request,
  ) async {
    return handleApi(() => _dataSource.createInsuranceProfile(request));
  }

  Future<Either<Failure, InsuranceProfileModel>> updateInsuranceProfile(
    int id,
    InsuranceProfileRequest request,
  ) async {
    return handleApi(() => _dataSource.updateInsuranceProfile(id, request));
  }
}
