import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/bloc/helper/either_extensions.dart';
import 'package:bond/features/auth/data/models/request/register_params.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../data/repositories/auth_repo_impl.dart';

@Injectable()
class RegisterCubit extends Cubit<BaseState<Unit>> with AsyncHandler<Unit> {
  final AuthRepositoryImpl authRepositoryImpl;

  RegisterCubit(this.authRepositoryImpl) : super(BaseState());

  Future<void> register({required RegisterParams params}) async {
    await handleAsync(
      identifier: 'register',
      call: () => authRepositoryImpl.register(params: params),
      onSuccess: (data) => data,
    );
  }
}
