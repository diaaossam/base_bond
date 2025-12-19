import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../enum/language.dart';
import '../../utils/app_strings.dart';

@Injectable()
class GlobalCubit extends Cubit<BaseState<void>> {
  final SharedPreferences sharedPreferences;

  GlobalCubit(this.sharedPreferences) : super(BaseState());

  Future<void> getAppSettings() async {
    try {
      emit(
        state.copyWith(identifier: "AppSettings", status: BaseStatus.loading),
      );
      final cachedLangCode = sharedPreferences.getString(AppStrings.locale);
      final cachedTheme = sharedPreferences.getString(AppStrings.theme);
      locale = Locale(cachedLangCode ?? AppStrings.arabicCode);
      language = handleLanguageByString(code: cachedLangCode ?? "ar");
      themeMode = cachedTheme != null
          ? cachedTheme == "light"
                ? ThemeMode.light
                : ThemeMode.dark
          : ThemeMode.light;

      emit(state.copyWith(status: BaseStatus.success));
    } catch (error) {
      emit(state.copyWith(status: BaseStatus.failure));
    }
  }

  ///////////////////////// App Lang ////////////////////////

  Locale locale = const Locale(AppStrings.arabicCode);
  Language language = Language.arabic;
  ThemeMode themeMode = ThemeMode.light;

  Future<void> changeLanguage({required Language lang}) async {
    emit(state.loading());
    await sharedPreferences.setString(AppStrings.locale, lang.name);
    locale = Locale(lang.name);
    language = lang;
    emit(state.success());
  }

  //////////////////// Theme ///////////////////////

  Future<void> chooseAppTheme({required ThemeMode theme}) async {
    emit(state.loading(identifier: "ChangeTheme"));
    themeMode = theme;
    await sharedPreferences.setString(AppStrings.theme, theme.name);
    emit(state.success(identifier: "ChangeTheme"));
  }
}
