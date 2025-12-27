import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

part 'main_state.dart';

@Injectable()
class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());
}
