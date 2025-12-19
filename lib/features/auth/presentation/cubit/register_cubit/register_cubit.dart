import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class RegisterCubit extends Cubit<BaseState<void>> {
  RegisterCubit() : super(BaseState.initial());
}
