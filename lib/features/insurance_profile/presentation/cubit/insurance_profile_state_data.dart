import 'dart:io';
import 'package:equatable/equatable.dart';
import '../../../../core/global_models/generic_model.dart';
import '../../data/models/insurance_profile_model.dart';

class InsuranceProfileStateData extends Equatable {
  final List<GenericModel> insuranceCompanies;
  final InsuranceProfileModel? profile;
  final GenericModel? selectedCompany;
  final String? customCompanyName;
  final String? insuranceNumber;
  final File? idCardFront;
  final File? idCardBack;
  final File? insuranceCardFront;
  final File? insuranceCardBack;

  const InsuranceProfileStateData({
    this.insuranceCompanies = const [],
    this.profile,
    this.selectedCompany,
    this.customCompanyName,
    this.insuranceNumber,
    this.idCardFront,
    this.idCardBack,
    this.insuranceCardFront,
    this.insuranceCardBack,
  });

  /// Check if the user selected "Other" company
  bool get isOtherCompanySelected => selectedCompany?.id == -1;

  /// Check if profile exists
  bool get hasProfile => profile != null;

  /// Check if form is valid for submission
  bool get isFormValid {
    if (selectedCompany == null) return false;
    if (isOtherCompanySelected && (customCompanyName?.isEmpty ?? true)) {
      return false;
    }
    if (insuranceNumber?.isEmpty ?? true) return false;
    return true;
  }

  InsuranceProfileStateData copyWith({
    List<GenericModel>? insuranceCompanies,
    InsuranceProfileModel? profile,
    GenericModel? selectedCompany,
    String? customCompanyName,
    String? insuranceNumber,
    File? idCardFront,
    File? idCardBack,
    File? insuranceCardFront,
    File? insuranceCardBack,
    bool clearProfile = false,
    bool clearSelectedCompany = false,
    bool clearCustomCompanyName = false,
    bool clearIdCardFront = false,
    bool clearIdCardBack = false,
    bool clearInsuranceCardFront = false,
    bool clearInsuranceCardBack = false,
  }) {
    return InsuranceProfileStateData(
      insuranceCompanies: insuranceCompanies ?? this.insuranceCompanies,
      profile: clearProfile ? null : (profile ?? this.profile),
      selectedCompany: clearSelectedCompany
          ? null
          : (selectedCompany ?? this.selectedCompany),
      customCompanyName: clearCustomCompanyName
          ? null
          : (customCompanyName ?? this.customCompanyName),
      insuranceNumber: insuranceNumber ?? this.insuranceNumber,
      idCardFront:
          clearIdCardFront ? null : (idCardFront ?? this.idCardFront),
      idCardBack: clearIdCardBack ? null : (idCardBack ?? this.idCardBack),
      insuranceCardFront: clearInsuranceCardFront
          ? null
          : (insuranceCardFront ?? this.insuranceCardFront),
      insuranceCardBack: clearInsuranceCardBack
          ? null
          : (insuranceCardBack ?? this.insuranceCardBack),
    );
  }

  @override
  List<Object?> get props => [
        insuranceCompanies,
        profile,
        selectedCompany,
        customCompanyName,
        insuranceNumber,
        idCardFront,
        idCardBack,
        insuranceCardFront,
        insuranceCardBack,
      ];
}


