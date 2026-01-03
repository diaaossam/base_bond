import 'dart:io';

import 'package:bond/features/location/data/models/response/my_address.dart';

import '../../../../../core/enum/payment_type.dart';

enum DeliveryMethod { pharmacy, delivery }

class PrescriptionStateData {
  final File? prescriptionImage;
  final DeliveryMethod deliveryMethod;
  final PaymentType paymentType;
  final MyAddress? selectedAddress;
  final String? couponCode;
  final num couponDiscount;
  final String note;

  const PrescriptionStateData({
    this.prescriptionImage,
    this.deliveryMethod = DeliveryMethod.pharmacy,
    this.paymentType = PaymentType.cash,
    this.selectedAddress,
    this.couponCode,
    this.couponDiscount = 0,
    this.note = '',
  });

  PrescriptionStateData copyWith({
    File? prescriptionImage,
    DeliveryMethod? deliveryMethod,
    PaymentType? paymentType,
    MyAddress? selectedAddress,
    String? couponCode,
    num? couponDiscount,
    String? note,
  }) {
    return PrescriptionStateData(
      prescriptionImage: prescriptionImage ?? this.prescriptionImage,
      deliveryMethod: deliveryMethod ?? this.deliveryMethod,
      paymentType: paymentType ?? this.paymentType,
      selectedAddress: selectedAddress ?? this.selectedAddress,
      couponCode: couponCode ?? this.couponCode,
      couponDiscount: couponDiscount ?? this.couponDiscount,
      note: note ?? this.note,
    );
  }
}





