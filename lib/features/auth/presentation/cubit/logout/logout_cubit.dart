import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/base_state.dart';

class LogoutCubit extends Cubit<BaseState<void>> {
  LogoutCubit() : super(BaseState.initial());
}
