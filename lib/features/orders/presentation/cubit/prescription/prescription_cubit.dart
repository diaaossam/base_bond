import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/enum/payment_type.dart';
import 'package:bond/features/location/data/models/response/my_address.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'prescription_state_data.dart';

@injectable
class PrescriptionCubit extends Cubit<BaseState<PrescriptionStateData>> {
  PrescriptionCubit() : super(BaseState(data: const PrescriptionStateData()));

  final TextEditingController noteController = TextEditingController();
  final TextEditingController discountController = TextEditingController();

  void setPrescriptionImage(File image) {
    emit(state.copyWith(
      data: state.data?.copyWith(prescriptionImage: image),
    ));
  }

  void setDeliveryMethod(DeliveryMethod method) {
    emit(state.copyWith(
      data: state.data?.copyWith(deliveryMethod: method),
    ));
  }

  void setPaymentType(PaymentType type) {
    emit(state.copyWith(
      data: state.data?.copyWith(paymentType: type),
    ));
  }

  void setSelectedAddress(MyAddress address) {
    emit(state.copyWith(
      data: state.data?.copyWith(selectedAddress: address),
    ));
  }

  void setCouponCode(String code) {
    emit(state.copyWith(
      data: state.data?.copyWith(couponCode: code),
    ));
  }

  void setCouponDiscount(num discount) {
    emit(state.copyWith(
      data: state.data?.copyWith(couponDiscount: discount),
    ));
  }

  void removeCoupon() {
    discountController.clear();
    emit(state.copyWith(
      data: state.data?.copyWith(
        couponCode: null,
        couponDiscount: 0,
      ),
    ));
  }

  Future<void> submitPrescription() async {
    if (state.data?.prescriptionImage == null) {
      emit(state.copyWith(
        status: BaseStatus.failure,
        error: 'prescriptionRequired',
      ));
      return;
    }

    emit(state.copyWith(status: BaseStatus.loading, identifier: 'submit'));

    try {
      // TODO: Implement API call to submit prescription
      await Future.delayed(const Duration(seconds: 2));
      
      emit(state.copyWith(
        status: BaseStatus.success,
        identifier: 'submit',
      ));
    } catch (e) {
      emit(state.copyWith(
        status: BaseStatus.failure,
        error: e.toString(),
      ));
    }
  }

  Future<void> applyCoupon(String code) async {
    if (code.isEmpty) return;
    
    emit(state.copyWith(status: BaseStatus.loading, identifier: 'coupon'));

    try {
      // TODO: Implement API call to validate coupon
      await Future.delayed(const Duration(seconds: 1));
      
      emit(state.copyWith(
        status: BaseStatus.success,
        identifier: 'coupon',
        data: state.data?.copyWith(
          couponCode: code,
          couponDiscount: 50, // Example discount
        ),
      ));
    } catch (e) {
      emit(state.copyWith(
        status: BaseStatus.failure,
        error: e.toString(),
        identifier: 'coupon',
      ));
    }
  }

  @override
  Future<void> close() {
    noteController.dispose();
    discountController.dispose();
    return super.close();
  }
}
