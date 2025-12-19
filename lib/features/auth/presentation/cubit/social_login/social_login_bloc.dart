import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import '../../../../../core/enum/social_enum.dart';
import '../../../data/repositories/auth_repo_impl.dart';

part 'social_login_event.dart';

@Injectable()
class SocialLoginBloc extends Cubit<BaseState<void>> {
  final AuthRepositoryImpl authRepositoryImpl;

  SocialLoginBloc(this.authRepositoryImpl) : super(BaseState.initial());

  Future<void> loginWithSocial({required SocialEnum socialEnum}) async {
    emit(BaseState.loading());
    final response = await authRepositoryImpl.socialLogin(
      socialEnum: socialEnum,
    );
    response.fold(
      (failure) => emit(BaseState.failure(error: failure)),
      (success) => emit(BaseState.success()),
    );
  }
}
