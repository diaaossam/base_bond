import 'package:injectable/injectable.dart';

import '../../../../core/global_models/generic_model.dart';
import '../../../../core/services/api/converters_helper.dart';
import '../../../../core/services/api/dio_consumer.dart';
import '../../../../core/services/api/end_points.dart';
import '../models/insurance_profile_model.dart';
import '../models/insurance_profile_params.dart';

abstract class InsuranceProfileDataSource {
  Future<List<GenericModel>> getInsuranceCompanies();

  Future<InsuranceProfileModel?> getInsuranceProfile();

  Future<InsuranceProfileModel> createInsuranceProfile({
    required InsuranceProfileRequest params,
  });

  Future<InsuranceProfileModel> updateInsuranceProfile({
    required num id,
    required InsuranceProfileRequest params,
  });
}

@LazySingleton(as: InsuranceProfileDataSource)
class InsuranceProfileDummyDataSource implements InsuranceProfileDataSource {
  final DioConsumer dioConsumer;

  InsuranceProfileDummyDataSource({required this.dioConsumer});

  @override
  Future<List<GenericModel>> getInsuranceCompanies() async {
    return await dioConsumer
        .get<List<GenericModel>>(EndPoints.insuranceCompany)
        .factory(
          (json) => ConvertersHelper.fromJsonList(json, GenericModel.fromJson),
        )
        .execute();
  }

  @override
  Future<InsuranceProfileModel?> getInsuranceProfile() async {
    return await dioConsumer
        .get(EndPoints.insuranceProfile)
        .factory((json) => InsuranceProfileModel.fromJson(json['data']))
        .execute();
  }

  @override
  Future<InsuranceProfileModel> createInsuranceProfile({
    required InsuranceProfileRequest params,
  }) async {
    return await dioConsumer
        .post(EndPoints.insuranceProfile)
        .body(params.toFormData())
        .factory((json) => InsuranceProfileModel.fromJson(json['data']))
        .execute();
  }

  @override
  Future<InsuranceProfileModel> updateInsuranceProfile({
    required num id,
    required InsuranceProfileRequest params,
  }) async {
    return await dioConsumer
        .put(EndPoints.insuranceProfile)
        .body(params.toFormData())
        .factory((json) => InsuranceProfileModel.fromJson(json['data']))
        .execute();
  }
}
