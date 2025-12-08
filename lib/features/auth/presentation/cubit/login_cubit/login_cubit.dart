import 'package:bond/core/bloc/base_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../data/repositories/auth_repo_impl.dart';

@injectable
class LoginCubit extends Cubit<BaseState<bool>> {
  final AuthRepositoryImpl authRepositoryImpl;

  LoginCubit(this.authRepositoryImpl) : super(BaseState.initial());

  Future<void> sendOtp({required String phone}) async {
    emit(BaseState.loading());
    final response = await authRepositoryImpl.loginUser(phone);
    emit(
      response.fold(
        (failure) => BaseState.failure(error: failure),
        (success) => BaseState.success(data: success),
      ),
    );
  }
}
