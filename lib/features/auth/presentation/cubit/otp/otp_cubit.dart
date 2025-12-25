import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/bloc/helper/either_extensions.dart';
import 'package:bond/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../data/models/request/otp_params.dart';

part 'otp_state.dart';

@injectable
class OtpCubit extends Cubit<BaseState<void>> with AsyncHandler<void> {
  final AuthRepositoryImpl authRepositoryImpl;

  OtpCubit(this.authRepositoryImpl) : super(BaseState());

  Future<void> verifyOtp({required OtpParams params}) async {
    handleAsync(
      call: () => authRepositoryImpl.verifyOtp(otpParams: params),
      identifier: 'otp',
      onSuccess: (data) => data,
    );
  }
}
