import 'dart:io';
import 'package:dio/dio.dart';

class InsuranceProfileRequest {
  final int insuranceCompanyId;
  final File? insuranceCardFront;
  final File? insuranceCardBack;
  final File? idCardFront;
  final File? idCardBack;
  final String? insuranceNumber;
  final String? companyName;

  InsuranceProfileRequest({
    required this.insuranceCompanyId,
    this.insuranceCardFront,
    this.insuranceCardBack,
    this.idCardFront,
    this.idCardBack,
    this.companyName,
    this.insuranceNumber,
  });

  FormData toFormData() {
    final formData = FormData();

    formData.fields.add(
      MapEntry('insurance_company_id', insuranceCompanyId.toString()),
    );
    if(companyName != null) {
      formData.fields.add(
      MapEntry('insurance_company_name', companyName.toString()),
    );
    }

    if (insuranceNumber != null) {
      formData.fields.add(MapEntry('insurance_number', insuranceNumber!));
    }

    if (insuranceCardFront != null) {
      formData.files.add(
        MapEntry(
          'insurance_card_front',
          MultipartFile.fromFileSync(
            insuranceCardFront!.path,
            filename: insuranceCardFront!.path.split('/').last,
          ),
        ),
      );
    }

    if (insuranceCardBack != null) {
      formData.files.add(
        MapEntry(
          'insurance_card_back',
          MultipartFile.fromFileSync(
            insuranceCardBack!.path,
            filename: insuranceCardBack!.path.split('/').last,
          ),
        ),
      );
    }

    if (idCardFront != null) {
      formData.files.add(
        MapEntry(
          'id_card_front',
          MultipartFile.fromFileSync(
            idCardFront!.path,
            filename: idCardFront!.path.split('/').last,
          ),
        ),
      );
    }

    if (idCardBack != null) {
      formData.files.add(
        MapEntry(
          'id_card_back',
          MultipartFile.fromFileSync(
            idCardBack!.path,
            filename: idCardBack!.path.split('/').last,
          ),
        ),
      );
    }

    return formData;
  }
}
