import '../../../../core/global_models/generic_model.dart';

class InsuranceProfileModel {
  InsuranceProfileModel({
    this.id,
    this.insuranceCompany,
    this.insuranceCardFront,
    this.insuranceCardBack,
    this.idCardFront,
    this.idCardBack,
    this.notes,
    this.createdAt,
    this.updatedAt,
  });

  InsuranceProfileModel.fromJson(dynamic json) {
    id = json['id'];
    insuranceCompany = json['insurance_company'] != null
        ? GenericModel.fromJson(json['insurance_company'])
        : null;
    insuranceCardFront = json['insurance_card_front'];
    insuranceCardBack = json['insurance_card_back'];
    idCardFront = json['id_card_front'];
    idCardBack = json['id_card_back'];
    notes = json['notes'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  num? id;
  GenericModel? insuranceCompany;
  String? insuranceCardFront;
  String? insuranceCardBack;
  String? idCardFront;
  String? idCardBack;
  String? notes;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (insuranceCompany != null) {
      map['insurance_company'] = insuranceCompany?.toMap();
    }
    map['insurance_card_front'] = insuranceCardFront;
    map['insurance_card_back'] = insuranceCardBack;
    map['id_card_front'] = idCardFront;
    map['id_card_back'] = idCardBack;
    map['notes'] = notes;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
