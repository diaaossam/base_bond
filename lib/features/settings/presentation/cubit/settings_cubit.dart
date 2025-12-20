import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/features/settings/data/models/app_settings.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/bloc/helper/either_extensions.dart';
import '../../data/repositories/settings_repo_impl.dart';

@injectable
class SettingsCubit extends Cubit<BaseState<AppSettings>>
    with AsyncHandler<AppSettings> {
  final SettingsRepositoryImpl settingsRepositoryImpl;

  SettingsCubit(this.settingsRepositoryImpl) : super(BaseState()){
    getAppSettings();
  }

  Future<void> getAppSettings() async {
    await handleAsync(
      identifier: 'settings',
      call: settingsRepositoryImpl.getAppSettings,
      onSuccess: (data) => data,
    );
  }
}
