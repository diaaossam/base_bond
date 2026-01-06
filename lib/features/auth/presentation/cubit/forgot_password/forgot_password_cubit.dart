import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/bloc/helper/either_extensions.dart';
import 'package:bond/features/auth/data/models/request/forgot_password_params.dart';
import 'package:bond/features/auth/data/models/response/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../data/repositories/auth_repo_impl.dart';

@Injectable()
class ForgotPasswordCubit extends Cubit<BaseState<Unit>>
    with AsyncHandler<Unit> {
  final AuthRepositoryImpl authRepositoryImpl;

  ForgotPasswordCubit(this.authRepositoryImpl) : super(BaseState());

  Future<void> forgotPassword({required String email}) async {
    await handleAsync(
      identifier: 'forgot_password',
      call: () => authRepositoryImpl.forgotPassword(
        params: ForgotPasswordParams(email: email),
      ),
      onSuccess: (data) => data,
    );
  }
}

@Injectable()
class ResetPasswordCubit extends Cubit<BaseState<UserModel>>
    with AsyncHandler<UserModel> {
  final AuthRepositoryImpl authRepositoryImpl;

  ResetPasswordCubit(this.authRepositoryImpl) : super(BaseState());

  Future<void> resetPassword({required ResetPasswordParams params}) async {
    await handleAsync(
      identifier: 'reset_password',
      call: () => authRepositoryImpl.verifyForgotPassword(params: params),
      onSuccess: (data) => data,
    );
  }
}


