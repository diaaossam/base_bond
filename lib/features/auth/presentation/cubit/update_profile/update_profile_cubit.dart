import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/bloc/helper/either_extensions.dart';
import 'package:bond/features/auth/data/models/request/register_params.dart';
import 'package:bond/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateProfileCubit extends Cubit<BaseState<bool>>
    with AsyncHandler<bool> {
  final AuthRepositoryImpl authRepository;

  UpdateProfileCubit(this.authRepository) : super(const BaseState());

  Future<void> updateProfile({required RegisterParams params}) async {
    handleAsync(
      call: () => authRepository.updateUserData(params: params),
      onSuccess: (data) => data,
    );
  }
}
