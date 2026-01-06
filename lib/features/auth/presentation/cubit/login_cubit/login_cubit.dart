import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/bloc/helper/either_extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../data/models/request/login_params.dart';
import '../../../data/models/response/user_model.dart';
import '../../../data/repositories/auth_repo_impl.dart';

@injectable
class LoginCubit extends Cubit<BaseState<UserModel>>
    with AsyncHandler<UserModel> {
  final AuthRepositoryImpl authRepositoryImpl;

  LoginCubit(this.authRepositoryImpl) : super(BaseState());

  Future<void> sendOtp({required LoginParams loginParams}) async {
    await handleAsync(
      call: () => authRepositoryImpl.loginUser(loginParams: loginParams),
      onSuccess: (data) => data,
    );
  }
}
