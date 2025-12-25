import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/bloc/helper/either_extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../data/repositories/auth_repo_impl.dart';

@injectable
class LoginCubit extends Cubit<BaseState<bool>> with AsyncHandler<bool> {
  final AuthRepositoryImpl authRepositoryImpl;

  LoginCubit(this.authRepositoryImpl) : super(BaseState());

  Future<void> sendOtp({required String phone}) async {
    await handleAsync(
      call: () => authRepositoryImpl.loginUser(phone),
      onSuccess: (data) => data,
    );
  }
}
