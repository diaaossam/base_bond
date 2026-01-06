import 'package:injectable/injectable.dart';

import '../../../../core/global_models/generic_model.dart';
import '../models/insurance_profile_model.dart';

abstract class InsuranceProfileDataSource {
  Future<List<GenericModel>> getInsuranceCompanies();

  Future<InsuranceProfileModel?> getInsuranceProfile();

  Future<InsuranceProfileModel> createInsuranceProfile(
    InsuranceProfileRequest request,
  );

  Future<InsuranceProfileModel> updateInsuranceProfile(
    int id,
    InsuranceProfileRequest request,
  );
}

@LazySingleton(as: InsuranceProfileDataSource)
class InsuranceProfileDummyDataSource implements InsuranceProfileDataSource {
  InsuranceProfileModel? _storedProfile;

  // Dummy insurance companies data
  static final List<GenericModel> _dummyCompanies = [
    const GenericModel(id: 1, title: 'أكسا للتأمين'),
    const GenericModel(id: 2, title: 'أليانز'),
    const GenericModel(id: 3, title: 'مصر للتأمين'),
    const GenericModel(id: 4, title: 'QNB للتأمين'),
    const GenericModel(id: 5, title: 'بوبا للتأمين'),
    const GenericModel(id: 6, title: 'MetLife'),
    const GenericModel(id: 7, title: 'GIG للتأمين'),
    const GenericModel(id: -1, title: 'أخرى'), // "Other" option
  ];

  @override
  Future<List<GenericModel>> getInsuranceCompanies() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return _dummyCompanies;
  }

  @override
  Future<InsuranceProfileModel?> getInsuranceProfile() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    return _storedProfile;
  }

  @override
  Future<InsuranceProfileModel> createInsuranceProfile(
    InsuranceProfileRequest request,
  ) async {
    await Future.delayed(const Duration(seconds: 1));

    final company = _dummyCompanies.firstWhere(
      (c) => c.id == request.insuranceCompanyId,
      orElse: () => const GenericModel(id: -1, title: 'أخرى'),
    );

    _storedProfile = InsuranceProfileModel(
      id: DateTime.now().millisecondsSinceEpoch,
      insuranceCompany: company,
      customCompanyName: request.customCompanyName,
      insuranceNumber: request.insuranceNumber,
      idCardFrontUrl: request.idCardFront?.path,
      idCardBackUrl: request.idCardBack?.path,
      insuranceCardFrontUrl: request.insuranceCardFront?.path,
      insuranceCardBackUrl: request.insuranceCardBack?.path,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    return _storedProfile!;
  }

  @override
  Future<InsuranceProfileModel> updateInsuranceProfile(
    int id,
    InsuranceProfileRequest request,
  ) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    final company = _dummyCompanies.firstWhere(
      (c) => c.id == request.insuranceCompanyId,
      orElse: () => const GenericModel(id: -1, title: 'أخرى'),
    );

    _storedProfile =
        _storedProfile?.copyWith(
          insuranceCompany: company,
          customCompanyName: request.customCompanyName,
          insuranceNumber: request.insuranceNumber,
          idCardFrontUrl:
              request.idCardFront?.path ?? _storedProfile?.idCardFrontUrl,
          idCardBackUrl:
              request.idCardBack?.path ?? _storedProfile?.idCardBackUrl,
          insuranceCardFrontUrl:
              request.insuranceCardFront?.path ??
              _storedProfile?.insuranceCardFrontUrl,
          insuranceCardBackUrl:
              request.insuranceCardBack?.path ??
              _storedProfile?.insuranceCardBackUrl,
          updatedAt: DateTime.now(),
        ) ??
        await createInsuranceProfile(request);

    return _storedProfile!;
  }
}

