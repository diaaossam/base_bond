import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/bloc/helper/either_extensions.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/request/prescription_params.dart';
import '../../../data/repositories/order_repository_impl.dart';

@injectable
class PrescriptionCubit extends Cubit<BaseState<PrescriptionParams>>
    with AsyncHandler<PrescriptionParams> {
  final OrderRepositoryImpl orderRepositoryImpl;

  PrescriptionCubit(this.orderRepositoryImpl)
    : super(BaseState(data: PrescriptionParams()));

  void setLocation({required num id , required bool isInsurance}) {
    final updatedParams = state.data?.copyWith(addressId: id,isInsurance: isInsurance);
    emit(state.copyWith(data: updatedParams));
  }

  void updatePrescriptionParams({required PrescriptionParams params}) {
    emit(state.copyWith(data: params));
  }

  Future<void> submitPrescription({required PrescriptionParams params}) async {
    handleAsync(
      identifier: "submit",
      call: () => orderRepositoryImpl.submitPrescription(params: params),
      onSuccess: (data) => state.data ?? PrescriptionParams(),
    );
  }
}
