import 'dart:io';
import 'package:equatable/equatable.dart';
import '../../../../core/global_models/generic_model.dart';

class InsuranceProfileModel extends Equatable {
  final int? id;
  final GenericModel? insuranceCompany;
  final String? customCompanyName;
  final String? insuranceNumber;
  final String? idCardFrontUrl;
  final String? idCardBackUrl;
  final String? insuranceCardFrontUrl;
  final String? insuranceCardBackUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const InsuranceProfileModel({
    this.id,
    this.insuranceCompany,
    this.customCompanyName,
    this.insuranceNumber,
    this.idCardFrontUrl,
    this.idCardBackUrl,
    this.insuranceCardFrontUrl,
    this.insuranceCardBackUrl,
    this.createdAt,
    this.updatedAt,
  });

  /// Get the display name for insurance company
  String get companyDisplayName {
    if (insuranceCompany?.id == -1 || insuranceCompany == null) {
      return customCompanyName ?? '';
    }
    return insuranceCompany?.title ?? '';
  }

  /// Check if using custom company name (selected "Other")
  bool get isCustomCompany => insuranceCompany?.id == -1;

  factory InsuranceProfileModel.fromJson(Map<String, dynamic> json) {
    return InsuranceProfileModel(
      id: json['id'],
      insuranceCompany: json['insurance_company'] != null
          ? GenericModel.fromJson(json['insurance_company'])
          : null,
      customCompanyName: json['custom_company_name'],
      insuranceNumber: json['insurance_number'],
      idCardFrontUrl: json['id_card_front_url'],
      idCardBackUrl: json['id_card_back_url'],
      insuranceCardFrontUrl: json['insurance_card_front_url'],
      insuranceCardBackUrl: json['insurance_card_back_url'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (insuranceCompany != null)
        'insurance_company_id': insuranceCompany!.id,
      if (customCompanyName != null) 'custom_company_name': customCompanyName,
      if (insuranceNumber != null) 'insurance_number': insuranceNumber,
      if (idCardFrontUrl != null) 'id_card_front_url': idCardFrontUrl,
      if (idCardBackUrl != null) 'id_card_back_url': idCardBackUrl,
      if (insuranceCardFrontUrl != null)
        'insurance_card_front_url': insuranceCardFrontUrl,
      if (insuranceCardBackUrl != null)
        'insurance_card_back_url': insuranceCardBackUrl,
    };
  }

  InsuranceProfileModel copyWith({
    int? id,
    GenericModel? insuranceCompany,
    String? customCompanyName,
    String? insuranceNumber,
    String? idCardFrontUrl,
    String? idCardBackUrl,
    String? insuranceCardFrontUrl,
    String? insuranceCardBackUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return InsuranceProfileModel(
      id: id ?? this.id,
      insuranceCompany: insuranceCompany ?? this.insuranceCompany,
      customCompanyName: customCompanyName ?? this.customCompanyName,
      insuranceNumber: insuranceNumber ?? this.insuranceNumber,
      idCardFrontUrl: idCardFrontUrl ?? this.idCardFrontUrl,
      idCardBackUrl: idCardBackUrl ?? this.idCardBackUrl,
      insuranceCardFrontUrl:
          insuranceCardFrontUrl ?? this.insuranceCardFrontUrl,
      insuranceCardBackUrl: insuranceCardBackUrl ?? this.insuranceCardBackUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        insuranceCompany,
        customCompanyName,
        insuranceNumber,
        idCardFrontUrl,
        idCardBackUrl,
        insuranceCardFrontUrl,
        insuranceCardBackUrl,
        createdAt,
        updatedAt,
      ];
}

/// Request model for creating/updating insurance profile
class InsuranceProfileRequest {
  final int? insuranceCompanyId;
  final String? customCompanyName;
  final String insuranceNumber;
  final File? idCardFront;
  final File? idCardBack;
  final File? insuranceCardFront;
  final File? insuranceCardBack;

  const InsuranceProfileRequest({
    this.insuranceCompanyId,
    this.customCompanyName,
    required this.insuranceNumber,
    this.idCardFront,
    this.idCardBack,
    this.insuranceCardFront,
    this.insuranceCardBack,
  });
}


