import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../../core/enum/deleivery_method.dart';
import '../../../../../core/enum/payment_type.dart';

class PrescriptionParams {
  final DeliveryMethod? deliveryMethod;
  final PaymentType? paymentType;
  final num? addressId;
  final num? pharmacyBranchId;
  final String? note;
  final File? prescriptionImage;
  final bool? isInsurance;

  PrescriptionParams({
    this.deliveryMethod = DeliveryMethod.home_delivery,
    this.paymentType = PaymentType.cash,
    this.addressId,
    this.pharmacyBranchId,
    this.note,
    this.prescriptionImage,
    this.isInsurance = false,
  });

  FormData toFormData() {
    final formData = FormData();

    formData.files.add(
      MapEntry(
        'prescription_image',
        MultipartFile.fromFileSync(
          prescriptionImage!.path,
          filename: prescriptionImage!.path.split('/').last,
        ),
      ),
    );

    if (note != null) {
      formData.fields.add(MapEntry('notes', note!));
    }
    formData.fields.add(MapEntry('delivery_way', deliveryMethod!.name));
    formData.fields.add(MapEntry('payment_method', paymentType!.name));
    if (addressId != null && deliveryMethod == DeliveryMethod.home_delivery) {
      formData.fields.add(MapEntry('address_id', addressId.toString()));
    }
    if (pharmacyBranchId != null &&
        deliveryMethod == DeliveryMethod.pharmacy_pickup) {
      formData.fields.add(
        MapEntry('pharmacy_branch_id', pharmacyBranchId.toString()),
      );
    }

    return formData;
  }

  PrescriptionParams copyWith({
    DeliveryMethod? deliveryMethod,
    PaymentType? paymentType,
    num? addressId,
    num? pharmacyBranchId,
    String? note,
    File? prescriptionImage,
    bool? isInsurance,
  }) {
    return PrescriptionParams(
      deliveryMethod: deliveryMethod ?? this.deliveryMethod,
      paymentType: paymentType ?? this.paymentType,
      addressId: addressId ?? this.addressId,
      pharmacyBranchId: pharmacyBranchId ?? this.pharmacyBranchId,
      note: note ?? this.note,
      prescriptionImage: prescriptionImage ?? this.prescriptionImage,
      isInsurance: isInsurance ?? this.isInsurance,
    );
  }
}
