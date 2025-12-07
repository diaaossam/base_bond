import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/bloc/base_state.dart';
import '../../../data/repositories/init_repo_impl.dart';

@Injectable()
class StartCubit extends Cubit<BaseState<PageRouteInfo>> {
  final InitRepo initRepo;

  StartCubit(this.initRepo) : super(BaseState.initial()) {
    initApp();
  }

  Future<void> initApp() async {
    emit(BaseState.loading());
    final response = await initRepo.initApp();
    response.fold(
      (failure) => emit(BaseState.failure(error: failure)),
      (data) => emit(BaseState.success(data: data)),
    );
  }
}
