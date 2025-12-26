import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/bloc/helper/either_extensions.dart';
import 'package:bond/features/settings/data/models/page_model.dart';
import 'package:bond/features/settings/data/repositories/settings_repo_impl.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@injectable
class PagesCubit extends Cubit<BaseState<PageModel>>
    with AsyncHandler<PageModel> {
  final SettingsRepositoryImpl settingsRepositoryImpl;

  PagesCubit(this.settingsRepositoryImpl) : super(BaseState());

  Future<void> getCustomPage({required num id}) async {
    handleAsync(
      call: () => settingsRepositoryImpl.getCustomPage(page: id.toInt()),
      onSuccess: (data) {
        print(data.title);
        return data;
      },
      identifier: "$id"
    );
  }
}
