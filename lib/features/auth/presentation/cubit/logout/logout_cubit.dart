import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/bloc/helper/either_extensions.dart';
import 'package:bond/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:injectable/injectable.dart';

@injectable
class LogoutCubit extends Cubit<BaseState<bool>> with AsyncHandler<bool> {
  final AuthRepositoryImpl authRepositoryImpl;

  LogoutCubit(this.authRepositoryImpl) : super(BaseState());

  Future<void> logout() async {
    handleAsync(
      call: () => authRepositoryImpl.logOut(),
      onSuccess: (data) => data,
    );
  }
}
