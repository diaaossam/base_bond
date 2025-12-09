import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import '../../../../../core/enum/social_enum.dart';

part 'social_login_event.dart';

@Injectable()
class SocialLoginBloc extends Bloc<SocialLoginEvent, BaseState<void>> {
  SocialLoginBloc() : super(BaseState.initial()) {
    on<LoginWithSocial>((event, emit) async {});
  }
}
