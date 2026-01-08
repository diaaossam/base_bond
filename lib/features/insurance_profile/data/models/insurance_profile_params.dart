import 'dart:io';
import 'package:dio/dio.dart';

class InsuranceProfileRequest {
  final int insuranceCompanyId;
  final File insuranceCardFront;
  final File insuranceCardBack;
  final File idCardFront;
  final File idCardBack;
  final String? notes;

  InsuranceProfileRequest({
    required this.insuranceCompanyId,
    required this.insuranceCardFront,
    required this.insuranceCardBack,
    required this.idCardFront,
    required this.idCardBack,
    this.notes,
  });

  FormData toFormData() {
    final formData = FormData();

    formData.fields.add(
      MapEntry('insurance_company_id', insuranceCompanyId.toString()),
    );

    if (notes != null) {
      formData.fields.add(MapEntry('notes', notes!));
    }

    formData.files.addAll([
      MapEntry(
        'insurance_card_front',
        MultipartFile.fromFileSync(
          insuranceCardFront.path,
          filename: insuranceCardFront.path.split('/').last,
        ),
      ),
      MapEntry(
        'insurance_card_back',
        MultipartFile.fromFileSync(
          idCardBack.path,
          filename: idCardBack.path.split('/').last,
        ),
      ),
      MapEntry(
        'id_card_front',
        MultipartFile.fromFileSync(
          idCardFront.path,
          filename: idCardFront.path.split('/').last,
        ),
      ),
      MapEntry(
        'id_card_back',
        MultipartFile.fromFileSync(
          idCardBack.path,
          filename: idCardBack.path.split('/').last,
        ),
      ),

    ]);

    return formData;
  }
}
